//
//  EVEStanding.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/11/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEStanding.h"

@interface EVEStanding ()

@end

@implementation EVEStanding

#pragma mark - Instance Methods

-(EVEStanding *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.entityId = @0;
      self.entityName = @"";
      self.standing = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"fromID":@"entityId",
                                                       @"fromName":@"entityName",
                                                       @"standing":@"standing"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Entity ID: %@, Name: %@, Standing: %@ }",
                                     self.entityId, self.entityName, self.standing];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"entityId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"entityName"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"standing"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
