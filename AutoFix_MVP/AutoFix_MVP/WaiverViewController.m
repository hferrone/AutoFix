//
//  WaiverViewController.m
//  AutoFix_MVP
//
//  Created by Harrison Ferrone on 2/25/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "WaiverViewController.h"

@interface WaiverViewController () <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *continueButton;

@end

@implementation WaiverViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.continueButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.continueButton.layer.borderWidth = 1;
    self.continueButton.layer.cornerRadius = 5;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (IBAction)continueOnButtonTapped:(UIButton *)sender
{
    UIAlertView *userAgreement = [[UIAlertView alloc] initWithTitle:@"Waiver Agreement" message:@"By continuing to the application, you are agreeing to this user waiver." delegate:self cancelButtonTitle:@"I Don't Agree" otherButtonTitles:@"I Agree", nil];
    [userAgreement show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        [self performSegueWithIdentifier:@"userAgreementSegueID" sender:self];
    }
}

@end
