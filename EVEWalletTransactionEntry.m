//
//  EVEWalletTransactionEntry.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/11/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEWalletTransactionEntry.h"

@interface EVEWalletTransactionEntry ()

@end

@implementation EVEWalletTransactionEntry

#pragma mark - Instance Methods

-(EVEWalletTransactionEntry *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.date = [EVEDate new];
      self.transactionId = @0;
      self.quantity = @0;
      self.typeName = @"";
      self.typeId = @0;
      self.price = @0;
      self.clientId = @0;
      self.clientName = @"";
      self.stationId = @0;
      self.stationName = @"";
      self.transactionType = @"";
      self.transactionFor = @"";
      self.journalRefId = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"transactionDateTime":@"date",
                                                       @"transactionID":@"transactionId",
                                                       @"quantity":@"quantity",
                                                       @"typeName":@"typeName",
                                                       @"typeID":@"typeId",
                                                       @"price":@"price",
                                                       @"clientID":@"clientId",
                                                       @"clientName":@"clientName",
                                                       @"stationID":@"stationId",
                                                       @"stationName":@"stationName",
                                                       @"transactionType":@"transactionType",
                                                       @"transactionFor":@"transactionFor",
                                                       @"journalTransactionID":@"journalRefId"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:
           @"Wallet Transaction Entry ID: %@ | Type { ID: %@, Name: %@ } | Quantity: %@ | "
           @"Price: %@ | Client { ID: %@, Name: %@ } | Transaction { Type: %@, For: %@ } | "
           @"Station { ID: %@, Name: %@ } | Journal Ref ID: %@ | Date: %@",
           self.transactionId, self.typeId, self.typeName, self.quantity, self.price,
           self.clientId, self.clientName, self.transactionType, self.transactionFor,
           self.stationId, self.stationName, self.journalRefId, self.date];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"date"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
   else if([key isEqualToString:@"transactionId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"quantity"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"typeName"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"typeId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"price"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"clientId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"clientName"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"stationId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"stationName"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"transactionType"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"transactionFor"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"journalRefId"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
