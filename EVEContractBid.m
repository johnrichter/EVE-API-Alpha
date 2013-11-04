//
//  EVEContractBid.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEContractBid.h"

@interface EVEContractBid ()

@end

@implementation EVEContractBid

#pragma mark - Instance Methods

-(EVEContractBid *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.bidId = @0;
      self.contractId = @0;
      self.bidderId = @0;
      self.dateBidPlaced = [EVEDate new];
      self.amount = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"bidID":@"bidId",
                                                       @"contractID":@"contractId",
                                                       @"bidderID":@"bidderId",
                                                       @"dateBid":@"dateBidPlaced",
                                                       @"amount":@"amount"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Contract Bid ID: %@ | Contract ID: %@ | "
                                     @"Bidder ID: %@ | Date Bid Placed: %@ | "
                                     @"Amount Bid: %@",
                                     self.bidId, self.contractId, self.bidderId,
                                     self.dateBidPlaced, self.amount];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"bidId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"contractId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"bidderId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"dateBidPlaced"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
   else if([key isEqualToString:@"amount"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
