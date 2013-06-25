//
//  OHS2AppDelegate.m
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 12/17/12.
//  Copyright (c) 2012 ZACHARY FLETCHER. All rights reserved.
//

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

//#define kjsonURL [NSURL URLWithString: @"http://baylife.me/mobile/json"]
#define kjsonURL [NSURL URLWithString: @"https://graph.facebook.com/142919315888548/feed?access_token=BAACEdEose0cBABU0PXay1XA0H9ZBOO5cEFATGabYgZCJgG1bBe2plLe88eXpWxgFrzdNQCd2yEIyJ1mZBcncPitn8AcfbjdY9ZCfH0v8kSZB8WffZC6TdxNoe0csGLqK16p4s2lEPKzLbKVdjtxAYEH0NRgaI9DFEZBmsvDJAK51tsUnHdEGppbvbNZBDmWRRQMZD"]

#import <Parse/Parse.h>
#import "OHS2AppDelegate.h"

@implementation OHS2AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  //  NSData* data = [NSData dataWithContentsOfURL:
   //
    //                kjsonURL];
    //if(!data) {
     //   UIAlertView*aview=[[UIAlertView alloc]initWithTitle:@"Connection Failed" message:@"Network error" delegate:self cancelButtonTitle:@"Bug" otherButtonTitles:nil, nil ];
       // [aview show];
       // return NO;
    //}
    [Parse setApplicationId:@"TNwVcBVZsFA8uAJnyG6CWAKrO1XRd7Q50adxnqE5"
                  clientKey:@"I7OzUycGRotKj9BPUSNTNGwJCYadr6WqvdLmsqWb"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
