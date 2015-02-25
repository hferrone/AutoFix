//
//  TireChangeViewController.m
//  AutoFix_MVP
//
//  Created by Harrison Ferrone on 2/25/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "TireChangeViewController.h"
#import "CustomInstructions.h"
#import "TireDetailViewController.h"

@interface TireChangeViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tireChangeTableviewController;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property NSArray *instructionStepArray;

@end

@implementation TireChangeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.backButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.backButton.layer.borderWidth = 1;
    self.backButton.layer.cornerRadius = 5;
    
    CustomInstructions *step1 = [[CustomInstructions alloc] initWithDescription:@"1. Locate the vehicle in a safe location for the tire change process (ie on the shoulder, side street, or parking lot)\n\n- Automatic Transmissions: place car in PARK and engage parking break\n\n- Manual Transmissions: place car in 1st gear and engage parking break" title:@"Step 1: Securing the car safely" tip:@"* PRO TIP: The location of the car must be as level and flat as possible"];
    
    CustomInstructions *step2 = [[CustomInstructions alloc] initWithDescription:@"1. Turn on four-way flashers and hazard lights.\n\n2. Block (wheel choke) the opposite wheel from the one you are changing the tire on.\n\n3. Remove spare tire, jack and lug wrench from your vehicle." title:@"Step 2: Caution lights" tip:@"* PRO TIP: Place all your equipment on the ground in a location that doesn't interfere with this process"];
    
    CustomInstructions *step3 = [[CustomInstructions alloc] initWithDescription:@"1. Remove the hub cap (if applicable) by prying if off with the end of the lug wrench (and place out of the way).\n\n2. LOOSEN (only loosen) the lug nuts while the vehicle has all four (4) wheels on the ground." title:@"Step 3: Hub cap removal" tip:@"* PRO TIP: DO NOT completely remove the lug nuts at this point"];
    
    CustomInstructions *step4 = [[CustomInstructions alloc] initWithDescription:@"1. Place the jack under the proper location of the vehicle (hard point/jacking point).\n\n2. Once the jack is properly placed, SLOWLY jack up the vehicle until the effected wheel is at least 2 inches off the ground." title:@"Step 4: Using the jack" tip:@"* PRO TIP: The hard point/jacking point of your car can be found in your vehicle manual"];
    
    CustomInstructions *step5 = [[CustomInstructions alloc] initWithDescription:@"1. Remove lug nuts completely.\n\n2. Remove the tire by placing one hand on each side of the tire, at the 9 and 3 o'clock positions.\n\n3. IF the tire will not come off the hub, GENTLY push (alternating) at the 9 and 3 o'clock positions until the tire is free.\n\n4. BE CAREFUL NOT TO PUSH THE VEHICLE OFF OF THE JACK." title:@"Step 5: Removing the tire" tip:@"* PRO TIP: Place the removed lug nuts in the dish of the hub cap or in a safe spot out of the way to avoid loss"];
    
    CustomInstructions *step6 = [[CustomInstructions alloc] initWithDescription:@"1. Place the damaged tire to the side and out of the way.\n\n2. Install the spare tire onto the hub. Again, being very careful not to push the vehicle off the jack.\n\n3. While holding the tire against the hub (so that it doesn't come off) LOOSELY install one lug nut as close to the 12 o'clock position as possible." title:@"Step 6: Installing the spare" tip:@"* PRO TIP: Only tighten the first lug nut SNUGGLY - do not tighten fully yet"];
    
    CustomInstructions *step7 = [[CustomInstructions alloc] initWithDescription:@"1. Push the tire in at the bottom (6 o'clock position) and install another lug nut at 6 o'clock - SNUG ONLY.\n\n2. Install the remaining lug nuts SNUG ONLY, so that the wheel is FLAT against the hub." title:@"Step 7: Securing the spare" tip:@"* PRO TIP: DO NOT fully tighten any of the lug nuts yet"];
    
    CustomInstructions *step8 = [[CustomInstructions alloc] initWithDescription:@"1. Lower the vehicle to the ground by lowering the jack.\n\n2. Tighten each lug nut to the final torque." title:@"Step 8: Lowering the car" tip:@"* PRO TIP: Locate the wrench handle in an orientation that the user is PULLING UP instead of pushing down"];
    
    CustomInstructions *step9 = [[CustomInstructions alloc] initWithDescription:@"Once all lug nuts have been fully torqued, remove the jack.\n\n2. Replace the hub cap (if applicable)." title:@"Step 9: Removing the jack" tip:@"* PRO TIP: Make sure you replace and account for all equipment and loose items"];
    
    CustomInstructions *step10 = [[CustomInstructions alloc] initWithDescription:@"1. Procee on your way, REMEMBERING that you need to get your old tire repaired or replaced as soon as possible." title:@"Step 10: Getting on your way" tip:@"* PRO TIP: If you have installed a 'donut' or temporary spare tire, these are usually only rated for 50 miles of travel"];
    
    self.instructionStepArray = @[step1, step2, step3, step4, step5, step6, step7, step8, step9, step10];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.instructionStepArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tireChangeCellID"];
    
    CustomInstructions *selectedStep = [self.instructionStepArray objectAtIndex:indexPath.row];
    cell.textLabel.text = selectedStep.stepTitle;
    cell.detailTextLabel.text = selectedStep.stepDescription;
    cell.textLabel.textColor =[UIColor whiteColor];
    
    if (selectedStep.hasBeenCompleted)
    {
        NSDictionary *attributes = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]};
        NSString *stepText = cell.textLabel.text;
        NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:stepText attributes:attributes];
        
        cell.textLabel.attributedText = attrText;
        //cell.accessoryType = UITableViewCellAccessoryCheckmark;
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
    if([segue.identifier isEqualToString:@"detailSegueID"])
    {
        TireDetailViewController *detailViewController = segue.destinationViewController;
        NSIndexPath *currentPath = [self.tireChangeTableviewController indexPathForSelectedRow];
        CustomInstructions *selectedStep = [self.instructionStepArray objectAtIndex:currentPath.row];
        selectedStep.hasBeenCompleted = YES;
        detailViewController.selectedStep = selectedStep;
    }
    
    [self.tireChangeTableviewController reloadData];
}

@end
