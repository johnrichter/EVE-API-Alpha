//
//  EVEWalletJournalEntry.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/11/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEWalletJournalEntry.h"

@interface EVEWalletJournalEntry ()

@end

@implementation EVEWalletJournalEntry

#pragma mark - Instance Methods

-(EVEWalletJournalEntry *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.date = [EVEDate new];
      self.refId = @0;
      self.refTypeId = @0;
      self.refTypeArgumentName = @"";
      self.refTypeArgumentId = @0;
      self.refTypeReason = @"";
      self.firstPartyName = @"";
      self.firstPartyId = @0;
      self.secondPartyName = @"";
      self.secondPartyId = @0;
      self.amount = @0;
      self.balance = @0;
      self.taxPaidToReceiverId = @0;
      self.taxAmount = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"date":@"date",
                                                       @"refID":@"refId",
                                                       @"refTypeID":@"refTypeId",
                                                       @"ownerName1":@"firstPartyName",
                                                       @"ownerID1":@"firstPartyId",
                                                       @"ownerName2":@"secondPartyName",
                                                       @"ownerID2":@"secondPartyId",
                                                       @"argName1":@"refTypeArgumentName",
                                                       @"argID1":@"refTypeArgumentId",
                                                       @"amount":@"amount",
                                                       @"balance":@"balance",
                                                       @"reason":@"refTypeReason",
                                                       @"taxReceiverID":@"taxPaidToReceiverId",
                                                       @"taxAmount":@"taxAmount"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:
           @"Wallet Journal Entry Date: %@ | First Party { Name: %@, ID: %@ } | Second "
           @"Party { Name: %@, ID: %@ } | Amount: %@ | Balance: %@ | Taxed Amount: %@ | "
           @"Tax Paid To: %@ |  Ref { ID: %@, Type ID: %@, Argument { Name: %@, ID: %@ }, "
           @"Reason: %@ }",
           self.date, self.firstPartyName, self.firstPartyId, self.secondPartyName,
           self.secondPartyId, self.amount, self.balance, self.taxAmount,
           self.taxPaidToReceiverId, self.refId, self.refTypeId, self.refTypeArgumentName,
           self.refTypeArgumentId, self.refTypeReason];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"date"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
   else if([key isEqualToString:@"refId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"refTypeId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"refTypeArgumentName"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"refTypeArgumentId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"refTypeReason"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"firstPartyName"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"firstPartyId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"secondPartyName"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"secondPartyId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"amount"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"balance"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"taxPaidToReceiverId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"taxAmount"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
