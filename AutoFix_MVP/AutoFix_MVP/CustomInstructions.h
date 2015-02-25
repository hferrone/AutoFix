//
//  CustomInstructions.h
//  AutoFix_MVP
//
//  Created by Harrison Ferrone on 2/25/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomInstructions : NSObject

@property NSString *stepDescription;
@property NSString *stepTitle;
@property NSString *stepProTip;
@property BOOL hasBeenCompleted;

-(instancetype)initWithDescription:(NSString*)stepDescription title:(NSString*)stepTitle tip:(NSString*)proTip;

@end
