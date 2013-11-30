//
//  EVESkill.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/16/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVESkill.h"

@interface EVESkill ()

@end

@implementation EVESkill

#pragma mark - Instance Methods

-(EVESkill *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.typeId = @0;
      self.skillpoints = @0;
      self.level = @0;
      self.published = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"typeID":@"typeId",
                                                       @"skillpoints":@"skillpoints",
                                                       @"level":@"level",
                                                       @"published":@"published"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Skill Type: %@, Level: %@, Skillpoints: %@, Published:%@",
                                     self.typeId, self.level,
                                     self.skillpoints, self.published];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"typeId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"skillpoints"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"level"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"published"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
