//
//  EVEWalletBalance.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/13/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEWalletBalance.h"

@interface EVEWalletBalance ()

@end

@implementation EVEWalletBalance

#pragma mark - Instance Methods

-(EVEWalletBalance *)init
{
   self = [super init];
   if (self)
   {
      // Initialize properties
      self.walletId = @0;
      self.walletKey = @0;
      self.walletBalance = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint setObjectValue:@"walletBalance"];
   [self.objectBlueprint addAttributesFromDictionary:@{@"accountID":@"walletId",
                                                       @"accountKey":@"walletKey",
                                                       @"balance":@"walletBalance"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Wallet Id: %@ | Key: %@ | Balance: %@",
                                     self.walletId,
                                     self.walletKey,
                                     self.walletBalance];
}

#pragma mark - Private Instance Methods

@end
