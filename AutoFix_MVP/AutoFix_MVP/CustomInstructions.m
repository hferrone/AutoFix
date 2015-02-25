//
//  CustomInstructions.m
//  AutoFix_MVP
//
//  Created by Harrison Ferrone on 2/25/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "CustomInstructions.h"

@implementation CustomInstructions

-(instancetype)initWithDescription:(NSString*)stepDescription title:(NSString*)stepTitle tip:(NSString*)proTip;
{
    self = [super init];
    
    self.stepDescription = stepDescription;
    self.stepTitle = stepTitle;
    self.stepProTip = proTip;
    
    return self;
}

@end
