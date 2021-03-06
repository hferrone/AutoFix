//
//  TireDetailViewController.m
//  AutoFix_MVP
//
//  Created by Harrison Ferrone on 2/25/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "TireDetailViewController.h"

@interface TireDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UITextView *protipTextView;

@end

@implementation TireDetailViewController

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
