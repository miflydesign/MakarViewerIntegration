//
//  MakarViewerManager.h
//  NativeObjc
//
//  Created by WEN WEI LIN on 2020/8/14.
//  Copyright © 2020 WEN WEI LIN. All rights reserved.
//

#include <UnityFramework/UnityFramework.h>
#include <UnityFramework/NativeCallProxy.h>

typedef NS_ENUM(NSInteger, MakarProjectType) {
    AR = 0,
    AR_SLAM,
    VR
};

typedef void (^Action)(void);

@protocol MakarViewerDelegate

-(void)makarDidLoad;
-(void)makarDidUnload;
-(void)makarDidQuit;

@end

@interface MakarViewerManager : NSObject<UnityFrameworkListener, NativeCallsProtocol>

+(instancetype)shared;

@property(weak, nonatomic) id<MakarViewerDelegate> delegate;

@property int gArgc;
@property char** gArgv;
@property (strong, nonatomic) NSDictionary* appLaunchOpts;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *apiKey;
@property (nonatomic, copy) Action InitializedCallback;
@property UnityFramework* ufw;
@property bool didQuit;

-(void)initializedWithKey:(NSString*)apiKey
                   window:(UIWindow*)window appLaunchOpts:(NSDictionary*)appLaunchOpts gArgc:(int)gArgc gArgv:(char**)gArgv;
-(void)showUserWith:(NSString*)userAccount;
-(void)showProjectWithProjectId:(NSString*)projId type:(MakarProjectType) projType;
-(void)unload;
-(void)quit;
-(void)setPause:(BOOL)isPause;
-(void)show;

- (void)applicationWillResignActive:(UIApplication*)application;
- (void)applicationDidEnterBackground:(UIApplication*)application;
- (void)applicationWillEnterForeground:(UIApplication*)application;
- (void)applicationDidBecomeActive:(UIApplication*)application;
- (void)applicationWillTerminate:(UIApplication*)application;

@end
