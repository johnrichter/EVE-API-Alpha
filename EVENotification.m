//
//  EVENotification.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/28/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVENotification.h"

@interface EVENotification ()

@end

@implementation EVENotification

#pragma mark - Instance Methods

-(EVENotification *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.notificationId = @0;
      self.typeId = @0;
      self.senderId = @0;
      self.dateSent = [EVEDate new];
      self.additionalInformation = @"";
      self.hasBeenRead = NO;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint setObjectValue:@"additionalInformation"];
   [self.objectBlueprint addAttributesFromDictionary:@{@"notificationID":@"notificationId",
                                                       @"senderID":@"senderId",
                                                       @"typeID":@"typeId",
                                                       @"sentDate":@"dateSent",
                                                       @"read":@"hasBeenRead"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Notification ID: %@ | Sender ID: %@ | "
           @"Type ID: %@ | Date Sent: %@ | Has Been Read: %s | Text:\n%@",
           self.notificationId, self.senderId, self.typeId,
           self.dateSent, self.hasBeenRead ? "Yes":"No", self.additionalInformation];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"notificationId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"senderId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"typeId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"hasBeenRead"])
   {
      [self setValue:NO forKey:key];
   }
   else if([key isEqualToString:@"additionalInformation"])
   {
      [self setValue:NO forKey:key];
   }
   else if([key isEqualToString:@"dateSent"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
}

@end
