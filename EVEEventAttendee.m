//
//  EVEEventAttendee.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/14/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEEventAttendee.h"

@interface EVEEventAttendee ()

@end

@implementation EVEEventAttendee

#pragma mark - Instance Methods

-(EVEEventAttendee *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"characterID":@"characterId",
                                                       @"characterName":@"characterName",
                                                       @"response":@"response"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Attendee Id: %@, Name: %@, Response: %@\n",
                                     self.characterId,
                                     self.characterName,
                                     self.response];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"characterId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"characterName"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"response"])
   {
      [self setValue:@"" forKey:key];
   }
}

@end
