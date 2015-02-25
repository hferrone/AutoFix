//
//  TireDetailViewController.m
//  AutoFix_MVP
//
//  Created by Harrison Ferrone on 2/25/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "TireDetailViewController.h"

@interface TireDetailViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;

@end

@implementation TireDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.backButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.backButton.layer.borderWidth = 1;
    self.backButton.layer.cornerRadius = 5;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
