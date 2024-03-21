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
    NSString *projectId = @"c2ca3fda-83fb-4a74-83ea-41bbe084e0a9";
    [[MakarViewerManager shared] showProjectWithProjectId:projectId type: AR];
}

- (IBAction)btnEnterARSlam:(id)sender
{
    NSString *projectId = @"830f8ae9117aa2bc30097ba16936bbe9";
    [[MakarViewerManager shared] showProjectWithProjectId:projectId type: AR_SLAM];
}

- (IBAction)btnEnterVr:(id)sender
{
    NSString *projectId = @"f6574a6c-4595-4124-8c9f-a9605a8b5d8c";
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
