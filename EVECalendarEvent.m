//
//  EVECalendarEvent.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/14/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECalendarEvent.h"

@interface EVECalendarEvent ()

@end

@implementation EVECalendarEvent

#pragma mark - Instance Methods

-(EVECalendarEvent *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.eventId = @0;
      self.ownerId = @0;
      self.ownerName = @"";
      self.eventDate = [EVEDate new];
      self.eventTitle = @"";
      self.duration = @0;
      self.importance = @0;
      self.response = @"";
      self.eventText = @"";
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"eventID":@"eventId",
                                                       @"ownerID":@"ownerId",
                                                       @"ownerName":@"ownerName",
                                                       @"eventDate":@"eventDate",
                                                       @"eventTitle":@"eventTitle",
                                                       @"duration":@"duration",
                                                       @"importance":@"importance",
                                                       @"response":@"response",
                                                       @"eventText":@"eventText"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"--- Calendar Event ---\n"
                                     @"Event ID:\t%@"
                                     @"Owner ID:\t%@"
                                     @"Owner Name:\t%@"
                                     @"Event Date:\t%@"
                                     @"Event Title:\t%@"
                                     @"Duration:\t%@"
                                     @"Importance:\t%@"
                                     @"Response:\t%@"
                                     @"Event Text:\t%@",
                                     self.eventId,
                                     self.ownerId,
                                     self.ownerName,
                                     self.eventDate,
                                     self.eventTitle,
                                     self.duration,
                                     self.importance,
                                     self.response,
                                     self.eventText];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"eventId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"ownerId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"ownerName"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"eventDate"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
   else if([key isEqualToString:@"eventTitle"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"duration"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"importance"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"response"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"eventText"])
   {
      [self setValue:@"" forKey:key];
   }
}

@end
