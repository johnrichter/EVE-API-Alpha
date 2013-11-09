//
//  EVEMarketOrder.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/8/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEMarketOrder.h"

@interface EVEMarketOrder ()

@end

@implementation EVEMarketOrder

#pragma mark - Instance Methods

-(EVEMarketOrder *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.orderId = @0;
      self.characterId = @0;
      self.stationId = @0;
      self.quantityEntered = @0;
      self.quantityRemaining = @0;
      self.minimumQuantity = @0;
      self.orderState = @0;
      self.typeId = @0;
      self.range = @0;
      self.walletKey = @0;
      self.duration = @0;
      self.iskInEscrow = @0;
      self.pricePerUnit = @0;
      self.orderCreationDate = [EVEDate new];
      self.isBuyOrder = NO;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"orderID":@"orderId",
                                                       @"charID":@"characterId",
                                                       @"stationID":@"stationId",
                                                       @"volEntered":@"quantityEntered",
                                                       @"volRemaining":@"quantityRemaining",
                                                       @"minVolume":@"minimumQuantity",
                                                       @"orderState":@"orderState",
                                                       @"typeID":@"typeId",
                                                       @"range":@"range",
                                                       @"accountKey":@"walletKey",
                                                       @"duration":@"duration",
                                                       @"escrow":@"iskInEscrow",
                                                       @"price":@"pricePerUnit",
                                                       @"bid":@"isBuyOrder",
                                                       @"issued":@"orderCreationDate"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:
           @"Market Order ID: %@ | Character ID: %@ | Station ID: %@ | Quantity: %@/%@ | "
           @"Minimum Units/Sale: %@ | State: %@ | Item Type ID: %@ | Range: %@ | "
           @"Using Wallet: %@ | Duration: %@ | ISK in Escrow: %@ | Price/Unit: %@ | "
           @"Is Buy Order: %s | Creation Date: %@",
           self.orderId, self.characterId, self.stationId, self.quantityRemaining,
           self.quantityEntered, self.minimumQuantity, self.orderState, self.typeId,
           self.range, self.walletKey, self.duration, self.iskInEscrow, self.pricePerUnit,
           self.isBuyOrder ? "Yes":"No", self.orderCreationDate];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"orderId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"characterId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"stationId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"quantityEntered"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"quantityRemaining"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"minimumQuantity"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"orderState"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"typeId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"range"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"walletKey"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"duration"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"iskInEscrow"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"pricePerUnit"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"orderCreationDate"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
   else if([key isEqualToString:@"isBuyOrder"])
   {
      [self setValue:NO forKey:key];
   }
}

@end
