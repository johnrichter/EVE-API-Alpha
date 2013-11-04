//
//  EVECallGroup.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECallGroup.h"

@interface EVECallGroup ()

@end

@implementation EVECallGroup

#pragma mark - Instance Methods

-(EVECallGroup *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.groupId = @0;
      self.name = @"";
      self.groupDescription = @"";
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"groupID":@"groupId",
                                                       @"name":@"name",
                                                       @"description":@"groupDescription"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Call Group %@ | Name: %@ | Description: %@",
                                       self.groupId, self.name, self.groupDescription];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"groupId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"name"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"groupDescription"])
   {
      [self setValue:@"" forKey:key];
   }
}

@end
