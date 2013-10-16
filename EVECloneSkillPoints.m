//
//  EVECloneSkillPoints.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECloneSkillPoints.h"

@interface EVECloneSkillPoints ()

@end

@implementation EVECloneSkillPoints

#pragma mark - Instance Methods

-(EVECloneSkillPoints *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.skillPoints = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint setObjectValue:@"skillPoints"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@", self.skillPoints];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"skillPoints"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
