//
//  AppDelegate.m
//  StrokeTrials
//
//  Created by The Mullets on 2/15/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "AppDelegate.h"
#import "LeftViewController.h"
#import "RightViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Figure out that we're on an iPad.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        //Grab a reference to the UISplitViewController
        UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
        
        //Grab a reference to the RightViewController and set it as the SVC's delegate.
        RightViewController *rightViewController = [splitViewController.viewControllers lastObject];
        splitViewController.delegate = rightViewController;
        
        //Grab a reference to the LeftViewController and get the first trial in the list.
        UINavigationController *leftNavController = [splitViewController.viewControllers objectAtIndex:0];
        LeftViewController *leftViewController = (LeftViewController *)[leftNavController topViewController];
        Trial *firstTrial = [[[leftViewController trials] objectAtIndex:0] objectForKey: @"trial"];
        //trial = [[_trials objectAtIndex:indexPath.row] objectForKey: @"trial"];
        
        //Set it as the RightViewController's trial.
        [rightViewController setTrial:firstTrial];
        
        //Set the RightViewController as the left's delegate.
        leftViewController.delegate = rightViewController;
    }
    
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