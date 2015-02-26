//
//  JumpCarViewController.m
//  AutoFix_MVP
//
//  Created by Harrison Ferrone on 2/26/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "JumpCarViewController.h"
#import "CustomInstructions.h"
#import "JumpDetailViewController.h"

@interface JumpCarViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *jumpCarTableView;
@property NSArray *jumpInstructionsArray;

@end

@implementation JumpCarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CustomInstructions *step1 = [[CustomInstructions alloc] initWithDescription:@"1. Locate the car battery of the dead car.\n\n2. Remove all battery covers and battery post covers.\n\n3. Turn off ALL electrical devices on the dead car." title:@"Step 1: Locating the dead battery" tip:@"* PRO TIP: Wear safety glasses whenever available."];
    
    CustomInstructions *step2 = [[CustomInstructions alloc] initWithDescription:@"1. Obtain a suitable car for jumping/boosting the dead battery.\n\n2. Position the booster car as clost to the dead battery as safely possible.\n\n3. Remove all battery covers and baterry post covers from the booster car battery." title:@"Step 2: Setting up the cars" tip:@"* PRO TIP: DO NOT let the vehicles touch each other."];
    
    CustomInstructions *step3 = [[CustomInstructions alloc] initWithDescription:@"1. Locate the jumper cables.\n\n2. Lay them out on the ground so that the four ends are not touching each other.\n\n3. Turn off all electrical devices on the booster car." title:@"Step 3: Setting up the cables" tip:@"* PRO TIP: Layout out the cables gives you an idea of whether or not the booster car is in the correct position and/or may need to be moved."];
    
    CustomInstructions *step4 = [[CustomInstructions alloc] initWithDescription:@"1. Turn off the booster car engine.\n\n2. Confirm that the four ends of the booster cables are not touching." title:@"Step 4: Finish setup" tip:@"* PRO TIP: Please be sure that you have followed all the instructions up to this point, as we will be connecting the electrical current next."];
    
    CustomInstructions *step5 = [[CustomInstructions alloc] initWithDescription:@"1. Carefully connect the positive booster cable (RED) to the positive post (RED) of the booster car battery.\n\n2. Carefully connect the negative booster cable (BLACK) to the negative post (BLACK) of the booster car battery.\n\n3. Carefully connect the positive booster cable (RED) to the positive post (RED) of the DEAD car battery.\n\n4. Start the booster car battery.\n\n5. Carefully connect the negative booster cable (BLACK) to the negative post (BLACK) of the DEAD car battery." title:@"Step 5: Connecting the cables" tip:@"* PRO TIP: This normally creates some sparking, as this step acts as a switch for the entire process. Be prepared, do not be startled, and do not drop the negative cable during this process."];
    
    CustomInstructions *step6 = [[CustomInstructions alloc] initWithDescription:@"1. Once the engine of the dead car has started, reverse the cable connection process by removing the negative (BLACK) booster cable from the dead battery car first, then continue on in the reverse order." title:@"Step 6: Properly unhooking the cables" tip:@"* PRO TIP: The reverse order is Black from dead car, RED from dead car, BLACK from booster car, RED from booster car."];
    
    CustomInstructions *step7 = [[CustomInstructions alloc] initWithDescription:@"1. Once you have confirmed that all cour cables are connected properly, start the engine of the dead car." title:@"Step 7: Jumpstart the car" tip:@"* PRO TIP: You may need to allow the booster car to charge the dead car battery for a few minutes."];
    
    CustomInstructions *step8 = [[CustomInstructions alloc] initWithDescription:@"1. Close the hood of both cars and be on about your way!" title:@"Step 8: Getting back on the road" tip:@"* PRO TIP: Return the favor whenever possible, helping someone else jump a car is great automotive karma."];
    
    self.jumpInstructionsArray = @[step1, step2, step3, step4, step5, step6, step7, step8];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.jumpCarTableView reloadData];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.jumpInstructionsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jumpCarCellID"];
    
    CustomInstructions *selectedStep = [self.jumpInstructionsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = selectedStep.stepTitle;
    cell.detailTextLabel.text = selectedStep.stepDescription;
    cell.textLabel.textColor =[UIColor whiteColor];
    
    if (selectedStep.hasBeenCompleted)
    {
        NSDictionary *attributes = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]};
        NSString *stepText = cell.textLabel.text;
        NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:stepText attributes:attributes];
        
        cell.textLabel.attributedText = attrText;
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    JumpDetailViewController *detailViewController = segue.destinationViewController;
    NSIndexPath *currentPath = [self.jumpCarTableView indexPathForSelectedRow];
    CustomInstructions *selectedStep = [self.jumpInstructionsArray objectAtIndex:currentPath.row];
    selectedStep.hasBeenCompleted = YES;
    detailViewController.selectedStep = selectedStep;
}
@end
