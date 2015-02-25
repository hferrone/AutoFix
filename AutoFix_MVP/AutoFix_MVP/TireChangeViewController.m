//
//  TireChangeViewController.m
//  AutoFix_MVP
//
//  Created by Harrison Ferrone on 2/25/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "TireChangeViewController.h"

@interface TireChangeViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation TireChangeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tireChangeCellID"];
    return cell;
}

@end
