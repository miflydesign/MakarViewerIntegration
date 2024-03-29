//
//  AppDelegate.m
//  NativeObjc
//
//  Created by WEN WEI LIN on 2020/8/13.
//  Copyright © 2020 WEN WEI LIN. All rights reserved.
//

#import "AppDelegate.h"
#import "MakarViewerManager.h"

//MARK: - Makar API KEY
NSString* makarApiKey = @"00000000-0000-0000-0000-000000000000";
//MARK: - Helper Variable
int gArgc = 0;
char** gArgv = nullptr;

@interface AppDelegate ()

@end

@implementation AppDelegate

// MARK: - UIApplicationDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[MakarViewerManager shared] initializedWithKey:makarApiKey
                                             window:self.window
                                      appLaunchOpts:launchOptions
                                              gArgc:gArgc
                                              gArgv:gArgv];
    
    [self setOrientationLock:UIInterfaceOrientationMaskPortrait];
    
    return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
    return self.orientationLock;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [[MakarViewerManager shared] applicationWillResignActive:application];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[MakarViewerManager shared] applicationDidEnterBackground:application];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [[MakarViewerManager shared] applicationWillEnterForeground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [[MakarViewerManager shared] applicationDidBecomeActive:application];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[MakarViewerManager shared] applicationWillTerminate:application];
}

@end

//MARK: - main
int main(int argc, char * argv[])
{
    gArgc = argc;
    gArgv = argv;
    
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}

