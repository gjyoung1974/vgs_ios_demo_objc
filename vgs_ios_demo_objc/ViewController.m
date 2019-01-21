//
//  ViewController.m
//  vgs_ios_demo_objc
//
//  Created by gyoung on 1/13/19.
//  Copyright © 2019 gyoung. All rights reserved.
//

#import "ViewController.h"
#import "SMJJSONPath.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtFirstName;
@property (weak, nonatomic) IBOutlet UITextField *txtLastName;
@property (weak, nonatomic) IBOutlet UITextView *httpPostTextView;
@property (weak, nonatomic) IBOutlet UITextField *txtSSN;
@property (weak, nonatomic) IBOutlet UITextField *txtCCN;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//Handle button TouchUp HTTP Post
- (IBAction)clickHttpPostBTN:(id)sender {
// Create the request.
NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://tntmfxsd6bq.SANDBOX.verygoodproxy.com/post"]];

// Specify that it will be a POST request
request.HTTPMethod = @"POST";

// This is how we set header fields
[request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];

//fetch our fields
NSString *sFirstName = _txtFirstName.text;
NSString *sLastName = _txtLastName.text;
NSString *sSSN = _txtSSN.text;
NSString *sCCN = _txtCCN.text;

//Build a JSON ojbect from a string
NSString *jsonString = [NSString stringWithFormat:@"[{\"id\": \"1\", \"Fname\":\"%@\"}, {\"id\": \"2\", \"Lname\":\"%@\"}, {\"id\": \"3\", \"SSN\":\"%@\"}, {\"id\": \"4\", \"CCN\":\"%@\"}]",sFirstName,sLastName,sSSN,sCCN];

//Marshal the built string as a jsonObject
NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
request.HTTPBody = jsonData;

// Create url connection and fire request
//NSData *response = [NSURLConnection sendSynchronousRequest:request
//                                         returningResponse:nil error:nil];

    
NSData *response = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:nil error:nil];
    
//NSString* newStr = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];

    
// convert to JSON
NSError *jsError = nil;
NSDictionary *res = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&jsError];

// extract specific value...
//NSArray *results = [res objectForKey:@"json"];
//
//for (NSDictionary *result in results) {
//    NSString *Fname = [result objectForKey:@"Fname"];
//    NSLog(@"Fname: %@", Fname);
//}

_httpPostTextView.text = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];

}

@end
