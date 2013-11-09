//
//  EVEMail.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/8/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEMail.h"

@interface EVEMail ()

@end

@implementation EVEMail

@synthesize toCorpOrAllianceIds = _toCorpOrAllianceIds;
@synthesize toCharacterIds = _toCharacterIds;
@synthesize toListIds = _toListIds;

#pragma mark - Instance Methods

-(EVEMail *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.messageId = @0;
      self.senderId = @0;
      self.dateSent = [EVEDate new];
      self.title = @"";
      self.toCorpOrAllianceIds = @"";
      self.toCharacterIds = @"";
      self.toListIds = @"";
      self.sentToCorpAndAllianceIds = @[];
      self.sentToCharacterIds = @[];
      self.sentToMailingListIds = @[];
      self.mailBody = @"";
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint setObjectValue:@"mailBody"];
   [self.objectBlueprint addAttributesFromDictionary:@{@"messageID":@"messageId",
                                                       @"senderID":@"senderId",
                                                       @"sentDate":@"dateSent",
                                                       @"title":@"title",
                                                       @"toCorpOrAllianceID":@"toCorpOrAllianceIds",
                                                       @"toCharacterIDs":@"toCharacterIds",
                                                       @"toListID":@"toListIds"}];
}

-(NSString *)description
{
   NSMutableString *mail = [NSMutableString new];
   
   [mail appendFormat:@"EVE Mail ID: %@ | Sender ID: %@ | Date Sent: %@ | Title: %@ | "
                      @"Sent To Character IDs: ",
                      self.messageId, self.senderId, self.dateSent, self.title];
   
   for (id object in self.sentToCharacterIds)
   {
      if ([object isEqual:[self.sentToCharacterIds lastObject]])
      {
         [mail appendFormat:@"%@ | Sent To Corps and Alliance IDs: ", object];
      }
      else
      {
         [mail appendFormat:@"%@, ", object];
      }
   }
   
   for (id object in self.sentToCorpAndAllianceIds)
   {
      if ([object isEqual:[self.sentToCorpAndAllianceIds lastObject]])
      {
         [mail appendFormat:@"%@ | Sent To Mailing List IDs: ", object];
      }
      else
      {
         [mail appendFormat:@"%@, ", object];
      }
   }
   
   for (id object in self.sentToMailingListIds)
   {
      if ([object isEqual:[self.sentToMailingListIds lastObject]])
      {
         [mail appendFormat:@"%@ | ", object];
      }
      else
      {
         [mail appendFormat:@"%@, ", object];
      }
   }
   
   [mail appendFormat:@"Body: %@", self.mailBody];
   
   return mail;
}

-(NSString *)toCorpOrAllianceIds
{
   return _toCorpOrAllianceIds;
}

-(void)setToCorpOrAllianceIds:(NSString *)toCorpOrAllianceIds
{
   if (_toCorpOrAllianceIds != toCorpOrAllianceIds)
   {
      _toCorpOrAllianceIds = [toCorpOrAllianceIds copy];
      self.sentToCorpAndAllianceIds = [_toCorpOrAllianceIds componentsSeparatedByString:@","];
   }
}

-(NSString *)toCharacterIds
{
   return _toCharacterIds;
}

-(void)setToCharacterIds:(NSString *)toCharacterIds
{
   if (_toCharacterIds != toCharacterIds)
   {
      _toCharacterIds = [toCharacterIds copy];
      self.sentToCharacterIds = [_toCharacterIds componentsSeparatedByString:@","];
   }
}

-(NSString *)toListIds
{
   return _toListIds;
}

-(void)setToListIds:(NSString *)toListIds
{
   if (_toListIds != toListIds)
   {
      _toListIds = [toListIds copy];
      self.sentToMailingListIds = [_toListIds componentsSeparatedByString:@","];
   }
}


#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"messageId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"senderId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"dateSent"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
   else if([key isEqualToString:@"title"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"toCorpOrAllianceIds"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"toCharacterIds"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"toListIds"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"sentToCorpAndAllianceIds"])
   {
      [self setValue:@[] forKey:key];
   }
   else if([key isEqualToString:@"sentToCharacterIds"])
   {
      [self setValue:@[] forKey:key];
   }
   else if([key isEqualToString:@"sentToMailingListIds"])
   {
      [self setValue:@[] forKey:key];
   }
   else if([key isEqualToString:@"mailBody"])
   {
      [self setValue:@"" forKey:key];
   }
}

@end
