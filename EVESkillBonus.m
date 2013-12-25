//
//  EVESkillBonus.m
//  EveAPI
//
//  Created by Johnathan Richter on 12/25/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVESkillBonus.h"

@interface EVESkillBonus ()

@end

@implementation EVESkillBonus

#pragma mark - Instance Methods

-(EVESkillBonus *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.bonusType = @"";
      self.bonusValue = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromArray:@[@"bonusType", @"bonusValue"]];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Skill Bonus Type: %@, Value: %@",
                                       self.bonusType, self.bonusValue];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"bonusType"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"bonusValue"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
