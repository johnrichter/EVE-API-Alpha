//
//  EVESkillTraining.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/10/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVESkillTraining.h"

@implementation EVESkillTraining

-(NSString *)description
{
   return [NSString stringWithFormat:@"Skill is Training: %s",
                                     self.boolValue ? "Yes":"No"];
}

@end
