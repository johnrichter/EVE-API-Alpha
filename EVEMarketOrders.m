//
//  EVEMarketOrders.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEMarketOrders.h"
#import "EVEMarketOrder.h"

@interface EVEMarketOrders ()

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

@end

@implementation EVEMarketOrders

#pragma mark - Instance Methods

-(EVEMarketOrders *)initWithEveKeyId:(NSString *)keyId
                               VCode:(NSString *)vCode
                         CharacterId:(NSNumber *)characterId
                             OrderId:(NSNumber *)orderId
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Market Orders";
      [self.uri appendString:@"char/MarketOrders.xml.aspx"];
      [self.uriArguments addEntriesFromDictionary:@{@"keyID":keyId,
                                                    @"vCode":vCode,
                                                    @"characterID":[characterId stringValue]}];
      self.orderId = @0;
      
      if (orderId && orderId > 0)
      {
         self.orderId = orderId;
         [self.uriArguments addEntriesFromDictionary:@{@"orderID":[orderId stringValue]}];
      }
      
      self.cakAccessMask = @4096;
      self.cacheStyle = kLongCache;
      self.legacyApiRestriction = kFullAccess;
      self.isLegacyApiKeyEnabled = NO;
      
      // Built Object Properties
      self.orders = [NSMutableArray new];
      
      // Instance Properties
      self.keyId = keyId;
      self.vCode = vCode;
      self.characterId = characterId;
      
      // Object Building Properties
      [self configureObjectBuilders];
   }
   
   return self;
}

-(void)queryTheApi
{
   [self.requestOperation start];
}

-(NSString *)description
{
   NSMutableString *api = [NSMutableString stringWithFormat:
                           @"%@ - Version %@\n\n"
                           @"URI:\t\t\t\t\t\t%@\n"
                           @"Legacy API Enabled:\t\t\t%s\n"
                           @"Legacy API Restriction:\t\t%@\n"
                           @"CAK Access Mask Required:\t%@\n"
                           @"Date Last Queried:\t\t\t%@\n"
                           @"Cached Until:\t\t\t\t%@\n"
                           @"Cache Style:\t\t\t\t%@\n"
                           @"API Error:\t\t\t\t\t%@\n\n",
                           self.commonName,
                           self.apiVersion,
                           self.uri,
                           self.isLegacyApiKeyEnabled ? "Yes":"No",
                           [EVEApiObject legacyApiRestrictionToString:self.legacyApiRestriction],
                           self.cakAccessMask,
                           self.lastQueried,
                           self.cachedUntil,
                           [EVEApiObject cacheStyleToString:self.cacheStyle],
                           self.apiError];
   
   for (id object in self.orders)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   return api;
}


#pragma mark - EVEApiProtool Methods

-(void)configureObjectBuilders
{
   ObjectBlueprint *order = [[EVEMarketOrder new] objectBlueprint];
   [order setXmlKeypath:@"eveapi.result.rowset.row"];
   
   // Add the blueprints to our collection
   [self.objectBlueprints addObject:order];
   
   // Configure our RequestOperation with URI and Arguements
   [self.requestOperation setUrl:self.uri
                  WithArguements:self.uriArguments
                      Blueprints:self.objectBlueprints];
}

#pragma mark - RequestOperationProtocolMethods

-(void)requestOperationSucceededWithObjects:(NSArray *)objects
{
   // Call our base classes protocol function
   [super requestOperationSucceededWithObjects:objects];
   
   for (id object in objects)
   {
      if ([object class] == [EVEMarketOrder class])
      {
         [self.orders addObject:object];
      }
   }
   
   [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromClass([self class])
                                                       object:nil
                                                     userInfo:nil];
}

-(void)requestOperationFailedWithError:(NSError *)error;
{
   [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromClass([self class])
                                                       object:nil
                                                     userInfo:@{@"error":error}];
}

@end
