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
    NSString *projectId = @"ea30c2d1ac96901393d20b6adc5f8e17";
    [[MakarViewerManager shared] showProjectWithProjectId:projectId type: AR];
}

- (IBAction)btnEnterARSlam:(id)sender
{
    NSString *projectId = @"ca6e231b9bde8183dc8f208ab619055a";
    [[MakarViewerManager shared] showProjectWithProjectId:projectId type: AR_SLAM];
}

- (IBAction)btnEnterVr:(id)sender
{
    NSString *projectId = @"9afc9adc7051393ceb639ea28100debd";
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

-(void)makarRequestUserInfoPage:(NSString *)userId{
    
}

@end
