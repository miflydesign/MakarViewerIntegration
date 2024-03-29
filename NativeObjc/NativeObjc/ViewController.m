//
//  ViewController.m
//  NativeObjc
//
//  Created by WEN WEI LIN on 2020/8/13.
//  Copyright © 2020 WEN WEI LIN. All rights reserved.
//

#import "ViewController.h"
#import "MakarViewerManager.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[MakarViewerManager shared] setDelegate:self];
}

- (IBAction)btnEnterAR:(id)sender
{
    NSString *projectId = @"2e011aec1f0be6547f9069bfe05816ee";
    [[MakarViewerManager shared] showProjectWithProjectId:projectId type: AR];
}

- (IBAction)btnEnterARSlam:(id)sender
{
    NSString *projectId = @"ca6e231b9bde8183dc8f208ab619055a";
    [[MakarViewerManager shared] showProjectWithProjectId:projectId type: AR_SLAM];
}

- (IBAction)btnEnterVr:(id)sender
{
    NSString *projectId = @"a1d05d718e2ba6991806e0698ceaab34";
    [[MakarViewerManager shared] showProjectWithProjectId:projectId type: VR];
}

//MARK: - MakarViewerDelegate
- (void)makarDidLoad {
    NSLog(@"Receive Makar did load");
}

- (void)makarDidUnload {
    NSLog(@"Receive Makar did unload");
}

- (void)makarDidQuit {
    NSLog(@"Receive Makar did quit");
}

-(void)makarRequestOrientation:(NSString *)orientation{
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    if([orientation isEqualToString:@"portrait"]){
        [appDelegate setOrientationLock:UIInterfaceOrientationMaskPortrait];
    }else{
        [appDelegate setOrientationLock:UIInterfaceOrientationMaskLandscape];
    }
    
}
@end
