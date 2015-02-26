//
//  JumpDetailViewController.m
//  AutoFix_MVP
//
//  Created by Harrison Ferrone on 2/26/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "JumpDetailViewController.h"

@interface JumpDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UITextView *protipTextView;

@end

@implementation JumpDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.descriptionTextView.text = self.selectedStep.stepDescription;
    self.protipTextView.text = self.selectedStep.stepProTip;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
