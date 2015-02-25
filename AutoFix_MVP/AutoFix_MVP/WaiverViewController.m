//
//  WaiverViewController.m
//  AutoFix_MVP
//
//  Created by Harrison Ferrone on 2/25/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "WaiverViewController.h"

@interface WaiverViewController ()
@property (weak, nonatomic) IBOutlet UIButton *continueButton;

@end

@implementation WaiverViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}
- (IBAction)continueOnButtonTapped:(UIButton *)sender {
}

@end
