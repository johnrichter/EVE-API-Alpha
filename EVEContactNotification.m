//
//  EVEContactNotification.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/28/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEContactNotification.h"

@interface EVEContactNotification ()

@end

@implementation EVEContactNotification

#pragma mark - Instance Methods

-(EVEContactNotification *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.senderName = @"";
      self.messageData = @"";
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromArray:@[@"senderName", @"messageData"]];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Notification ID: %@ | Sender ID: %@ | "
                                     @"Sender Name: %@ | Date Sent: %@ | Data: %@",
                                     self.notificationId, self.senderId, self.senderName,
                                     self.dateSent, self.messageData];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   [super setNilValueForKey:key];
   
   if([key isEqualToString:@"notificationId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"senderId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"senderName"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"messageData"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"dateSent"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
}

@end
