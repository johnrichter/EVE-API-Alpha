//
//  EVESkillTrainingTQTime.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/10/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVESkillTrainingTQDate.h"

@interface EVESkillTrainingTQDate ()

@end

@implementation EVESkillTrainingTQDate

#pragma mark - Instance Methods

-(EVESkillTrainingTQDate *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.offset = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [super configureObjectBlueprint];
   
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttribute:@"offset"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"TQ Time: %@ | Offset: %@",
                                     self.date, self.offset];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"date"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
   else if([key isEqualToString:@"offset"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
