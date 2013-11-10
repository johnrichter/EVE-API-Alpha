//
//  EVEMedal.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/10/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEMedal.h"

@interface EVEMedal ()

@end

@implementation EVEMedal

#pragma mark - Instance Methods

-(EVEMedal *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.medalId = @0;
      self.reason = @"";
      self.status = @"";
      self.issuerId = @0;
      self.dateIssued = [EVEDate new];
      self.fromCorporationId = @0;
      self.title = @"";
      self.medalDescription = @"";
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"medalID":@"medalId",
                                                       @"reason":@"reason",
                                                       @"status":@"status",
                                                       @"issuerID":@"issuerId",
                                                       @"issued":@"dateIssued",
                                                       @"corporationID":@"fromCorporationId",
                                                       @"title":@"title",
                                                       @"description":@"medalDescription"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Medal ID: %@ | Status: %@ | "
                                     @"Issued By { Character ID: %@ | Corporation ID: %@ | "
                                     @"On Date: %@ } | Title: %@ | Reason: %@ | "
                                     @"Description: %@",
                                     self.medalId, self.status, self.issuerId,
                                     self.fromCorporationId, self.dateIssued, self.title,
                                     self.reason, self.medalDescription];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"medalId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"reason"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"status"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"issuerId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"dateIssued"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
   else if([key isEqualToString:@"fromCorporationId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"title"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"medalDescription"])
   {
      [self setValue:@"" forKey:key];
   }
}

@end
