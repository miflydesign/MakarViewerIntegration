//
//  MakarViewerManager.m
//  NativeObjc
//
//  Created by WEN WEI LIN on 2020/8/13.
//  Copyright © 2020 WEN WEI LIN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MakarViewerManager.h"

//MARK: - UnityFrameworkLoad Singleton
UnityFramework* UnityFrameworkLoad()
{
    NSString* bundlePath = nil;
    bundlePath = [[NSBundle mainBundle] bundlePath];
    bundlePath = [bundlePath stringByAppendingString: @"/Frameworks/UnityFramework.framework"];
    
    NSBundle* bundle = [NSBundle bundleWithPath: bundlePath];
    if ([bundle isLoaded] == false) [bundle load];
    
    UnityFramework* ufw = [bundle.principalClass getInstance];
    if (![ufw appController])
    {
        // unity is not initialized
        [ufw setExecuteHeader: &_mh_execute_header];
    }
    return ufw;
}

@implementation MakarViewerManager

+(instancetype)shared{
    static MakarViewerManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[MakarViewerManager alloc] init];
    });
    return instance;
}

- (bool)isInitialized { return [self ufw] && [[self ufw] appController]; }

-(void)initializedWithKey:(NSString*)apiKey
                   window:(UIWindow*)window appLaunchOpts:(NSDictionary*)appLaunchOpts gArgc:(int)gArgc gArgv:(char**)gArgv
{
    self.apiKey = apiKey;
    self.window = window;
    self.appLaunchOpts = appLaunchOpts;
    self.gArgc = gArgc;
    self.gArgv = gArgv;
}

- (void)showUserWith:(NSString*)account
{
    NSString * param = account;
    const char* funcName = [@"ShowUser" UTF8String];
    
    if(![self isInitialized]) {
        
        __weak typeof(self) weakSelf = self;
        self.InitializedCallback = ^(void)
        {
            [weakSelf callMakarWithFuncName:funcName andMessage:[param UTF8String]];
        };
        [self initialize];
        
    }else{
        [self show];
        [self callMakarWithFuncName:funcName andMessage:[param UTF8String]];
    }

}

- (void)showProjectWithProjectId:(NSString*)proId type:(MakarProjectType)projType
{
    NSString* param = [NSString stringWithFormat:@"%@&%@",proId, [self getProjectTypeValue:projType]];
    const char* funcName = [@"ShowProject" UTF8String];
    
    if(![self isInitialized]) {
        
        __weak typeof(self) weakSelf = self;
        self.InitializedCallback = ^(void)
        {
            [weakSelf callMakarWithFuncName:funcName andMessage:[param UTF8String]];            
        };
        [self initialize];
        
    }else{
        [self show];
        [self callMakarWithFuncName:funcName andMessage:[param UTF8String]];
    }
}

- (void)callMakarWithFuncName:(const char*)funcName andMessage:(const char*)msg
{
    [[self ufw] sendMessageToGOWithName: "NativeHelper" functionName: funcName message: msg];
}

-(NSString*)getProjectTypeValue:(MakarProjectType)type{
    NSArray *arr = @[@"ar", @"ar_slam", @"vr"];
    return (NSString*) arr[type];
}

//MARK: - NativeCallsProtocol
- (void)showHostMainWindow
{
    [self.window makeKeyAndVisible];
}

-(void)makarDidLoad
{
    [self configurateWithKey:self.apiKey];
    if (self.InitializedCallback != nil) {
        self.InitializedCallback();
        self.InitializedCallback = nil;
    }
    
    [self.delegate makarDidLoad];
}

- (void)configurateWithKey:(NSString*)apiKey
{
    const char* param = [apiKey UTF8String];
    const char* funcName = [@"configuration" UTF8String];
    
    [self callMakarWithFuncName:funcName andMessage:param];
}

//MARK: - UnityFramework function
- (void)initialize
{
    if([self isInitialized]) {
        NSLog(@"Makar already initialized, Please Unload Makar first");
        return;
    }
    if([self didQuit]) {
        NSLog(@"Makar cannot be initialized after quit, Use unload instead");
        return;
    }
    
    [self setUfw: UnityFrameworkLoad()];
    [[self ufw] setDataBundleId: "com.unity3d.framework"];
    [[self ufw] registerFrameworkListener: self];
    [NSClassFromString(@"FrameworkLibAPI") registerAPIforNativeCalls:self];
    
    [[self ufw] runEmbeddedWithArgc: self.gArgc argv: self.gArgv appLaunchOpts: self.appLaunchOpts];
    
    // set quit handler to change default behavior of exit app
    [[self ufw] appController].quitHandler = ^(){ NSLog(@"AppController.quitHandler called"); };
     
}

- (void)unload
{
    if(![self isInitialized]) {
        NSLog(@"Makar is not initialized, Initialize Makar first");
    } else {
        [UnityFrameworkLoad() unloadApplication];
    }
}

- (void)setPause:(BOOL)isPause
{
    if(![self isInitialized]) {
        NSLog(@"Makar is not initialized, Initialize Makar first");
    } else {
        [UnityFrameworkLoad() pause:isPause];
    }
}

- (void)show
{
    if(![self isInitialized]) {
        NSLog(@"Unity is not initialized, Please Initialize Unity first");
    } else {
        [[self ufw] showUnityWindow];
    }
}

- (void)quit
{
    if(![self isInitialized]) {
        NSLog(@"Makar is not initialized, Initialize Makar first");
    } else {
        [UnityFrameworkLoad() quitApplication:0];
    }
}

//MARK: - UnityFramework callback
- (void)unityDidUnload:(NSNotification*)notification
{
    [[self ufw] unregisterFrameworkListener: self];
    [self setUfw: nil];
    [self showHostMainWindow];
    
    [self.delegate makarDidUnload];
}

- (void)unityDidQuit:(NSNotification*)notification
{
    [[self ufw] unregisterFrameworkListener: self];
    [self setUfw: nil];
    [self setDidQuit:true];
    [self showHostMainWindow];
    
    [self.delegate makarDidQuit];
}


- (void)applicationWillResignActive:(UIApplication*)application
{
    [[[self ufw] appController] applicationWillResignActive: application];
}

- (void)applicationDidEnterBackground:(UIApplication*)application
{
    [[[self ufw] appController] applicationDidEnterBackground: application];
}

- (void)applicationWillEnterForeground:(UIApplication*)application
{
    [[[self ufw] appController] applicationWillEnterForeground: application];
}

- (void)applicationDidBecomeActive:(UIApplication*)application
{
    [[[self ufw] appController] applicationDidBecomeActive: application];
}

- (void)applicationWillTerminate:(UIApplication*)application
{
    [[[self ufw] appController] applicationWillTerminate: application];
}

@end
