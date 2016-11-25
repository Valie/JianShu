//
//  AppDelegate.m
//  VEJianShuMenu
//
//  Created by WL on 16/6/20.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "AppDelegate.h"
#import <dlfcn.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [self loadReveal];
  
  return YES;
}

void *_revealLib = NULL;
- (void)loadReveal {
  NSString *revealLibName = @"libReveal";
  NSString *revealLibExtension = @"dylib";
  NSString *dyLibPath = [[NSBundle mainBundle] pathForResource:revealLibName ofType:revealLibExtension];
  NSLog(@"Loading dynamic library: %@", dyLibPath);
  _revealLib = dlopen([dyLibPath cStringUsingEncoding:NSUTF8StringEncoding], RTLD_NOW);
  if (_revealLib == NULL) {
    char *error = dlerror();
    NSLog(@"dlopen error: %s", error);
    NSString *message = [NSString stringWithFormat:@"%@.%@ failed to loadwith error: %s", revealLibName, revealLibExtension, error];
    [[[UIAlertView alloc] initWithTitle:@"Reveal library could not be loaded" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
  }
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
