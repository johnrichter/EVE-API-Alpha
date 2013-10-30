//
//  EVEContract.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/29/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEContract.h"

@interface EVEContract ()

@end

@implementation EVEContract

#pragma mark - Instance Methods

-(EVEContract *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.acceptorId = @0;
      self.assigneeId = @0;
      self.availability = @"";
      self.buyout = @0;
      self.collateral = @0;
      self.contractId = @0;
      self.dateAccepted = [EVEDate new];
      self.dateCompleted = [EVEDate new];
      self.dateExpired = [EVEDate new];
      self.dateIssued = [EVEDate new];
      self.endStationId = @0;
      self.onBehalfOfCorp = NO;
      self.issuerCorpId = @0;
      self.issuerId = @0;
      self.numDays = @0;
      self.price = @0;
      self.reward = @0;
      self.startStationId = @0;
      self.status = @"";
      self.contractDescription = @"";
      self.type = @"";
      self.volume = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"acceptorID":@"acceptorId",
                                                       @"assigneeID":@"assigneeId",
                                                       @"availability":@"availability",
                                                       @"buyout":@"buyout",
                                                       @"collateral":@"collateral",
                                                       @"contractID":@"contractId",
                                                       @"dateAccepted":@"dateAccepted",
                                                       @"dateCompleted":@"dateCompleted",
                                                       @"dateExpired":@"dateExpired",
                                                       @"dateIssued":@"dateIssued",
                                                       @"endStationID":@"endStationId",
                                                       @"forCorp":@"onBehalfOfCorp",
                                                       @"issuerCorpID":@"issuerCorpId",
                                                       @"issuerID":@"issuerId",
                                                       @"numDays":@"numDays",
                                                       @"price":@"price",
                                                       @"reward":@"reward",
                                                       @"startStationID":@"startStationId",
                                                       @"status":@"status",
                                                       @"title":@"contractDescription",
                                                       @"type":@"type",
                                                       @"volume":@"volume"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Contract Acceptor ID: %@ | Assignee ID: %@ | "
                                     @"Availability: %@ | Buyout: %@ | Collateral: %@ | "
                                     @"Contract ID: %@ | Date Accepted: %@ | "
                                     @"Date Completed: %@ | Date Expired: %@ | "
                                     @"Date Issued: %@ | End Station ID: %@ | "
                                     @"On Behalf of Corp: %s | Issuer Corp ID: %@ | "
                                     @"Issuer ID: %@ | Num Days: %@ | Price: %@ | "
                                     @"Reward: %@ | Start Station ID: %@ | "
                                     @"Status: %@ | Description: %@ | Type: %@ | "
                                     @"Volume: %@",
                                     self.acceptorId, self.assigneeId, self.availability,
                                     self.buyout, self.collateral, self.contractId,
                                     self.dateAccepted, self.dateCompleted,
                                     self.dateExpired, self.dateIssued, self.endStationId,
                                     self.onBehalfOfCorp ? "Yes":"No", self.issuerCorpId,
                                     self.issuerId, self.numDays, self.price,
                                     self.reward, self.startStationId, self.status,
                                     self.contractDescription, self.type, self.volume];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"acceptorId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"assigneeId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"availability"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"buyout"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"collateral"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"contractId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"dateAccepted"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
   else if([key isEqualToString:@"dateCompleted"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
   else if([key isEqualToString:@"dateExpired"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
   else if([key isEqualToString:@"dateIssued"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
   else if([key isEqualToString:@"endStationId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"onBehalfOfCorp"])
   {
      [self setValue:NO forKey:key];
   }
   else if([key isEqualToString:@"issuerCorpId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"issuerId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"numDays"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"price"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"reward"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"startStationId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"status"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"contractDescription"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"type"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"volume"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
