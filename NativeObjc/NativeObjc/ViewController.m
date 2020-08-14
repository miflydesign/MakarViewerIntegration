//
//  ViewController.m
//  NativeObjc
//
//  Created by WEN WEI LIN on 2020/8/13.
//  Copyright © 2020 WEN WEI LIN. All rights reserved.
//

#import "ViewController.h"
#import "MakarViewerManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[MakarViewerManager shared] setDelegate:self];
}

- (IBAction)btnEnterProjectTap:(id)sender
{
    NSString *projectId = @"2e011aec1f0be6547f9069bfe05816ee";
    [[MakarViewerManager shared] showProjectWithProjectId:projectId type: AR];
}

- (IBAction)btnOpenUserTap:(id)sender
{
    NSString *userAccount = @"miflyTest";
    [[MakarViewerManager shared] showUserWith:userAccount];
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

@end
