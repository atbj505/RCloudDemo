//
//  AppDelegate.m
//  RCloudDemo
//
//  Created by Robert on 16/5/9.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import "AppDelegate.h"
#import "IMService+Connect.h"
#import "ViewController.h"


@interface AppDelegate ()

@end


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //robert rg2IPnRCD/tZqhZpBbvbg+QlHM19NWJxDanWpG0+73ptPI3CEBj9IcOM9UU1S4BAnjnARN4Y6EtTFGHljU6mNw==
    //080904 nE6Mrb9Rbdb8sDfXEO05Hlp+MCW6KAJIche2lJ5eytpqtN64OW1hfqZwxJwRRv3rPQ0zo+BjJykrmtr2lgR+aA==

    [[IMService sharedIMService] connectWithToken:@"nE6Mrb9Rbdb8sDfXEO05Hlp+MCW6KAJIche2lJ5eytpqtN64OW1hfqZwxJwRRv3rPQ0zo+BjJykrmtr2lgR+aA==" success:^(NSString *userId) {

    } error:^(RCConnectErrorCode status){

    }];

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIViewController *vc = [[ViewController alloc] init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
