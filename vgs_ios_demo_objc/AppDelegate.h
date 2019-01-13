//
//  AppDelegate.h
//  vgs_ios_demo_objc
//
//  Created by gyoung on 1/13/19.
//  Copyright © 2019 gyoung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

