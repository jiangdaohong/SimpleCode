//
//  AppDelegate.m
//  SimpleCode
//
//  Created by 江道洪 on 2016/12/10.
//  Copyright © 2016年 江道洪. All rights reserved.
//

#import "DHAppDelegate.h"
#import "DHHomeViewController.h"
#import "DHNavigationController.h"

@interface DHAppDelegate ()

@end

@implementation DHAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    DHHomeViewController *homeVC = [DHHomeViewController new];
    DHNavigationController *navc = [[DHNavigationController alloc] initWithRootViewController:homeVC];
    self.window.rootViewController = navc;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
