//
//  EVENotifications.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVENotifications.h"
#import "EVENotification.h"

@interface EVENotifications ()

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

@end

@implementation EVENotifications

#pragma mark - Instance Methods

-(EVENotifications *)initWithEveKeyId:(NSString *)keyId
                                VCode:(NSString *)vCode
                          CharacterId:(NSNumber *)characterId
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Notifications";
      [self.uri appendString:@"char/Notifications.xml.aspx"];
      [self.uriArguments addEntriesFromDictionary:@{@"keyID":keyId,
                                                    @"vCode":vCode,
                                                    @"characterID":[characterId stringValue]}];
      self.cakAccessMask = @16384;
      self.cacheStyle = kModifiedShortCache;
      self.legacyApiRestriction = kFullAccess;
      self.isLegacyApiKeyEnabled = NO;
      
      // Built Object Properties
      self.notifications = [NSMutableArray new];
      
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
   
   for (id object in self.notifications)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   return api;
}


#pragma mark - EVEApiProtool Methods

-(void)configureObjectBuilders
{
   ObjectBlueprint *notification = [[EVENotification new] objectBlueprint];
   [notification setXmlKeypath:@"eveapi.result.rowset.row"];
   
   // Add the blueprints to our collection
   [self.objectBlueprints addObject:notification];
   
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
      if ([object class] == [EVENotification class])
      {
         [self.notifications addObject:object];
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
