//
//  EVEAssetList.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEAssetList.h"
#import "EVEAsset.h"
#import "BlueprintRelationship.h"

@interface EVEAssetList ()

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

@end

@implementation EVEAssetList

#pragma mark - Instance Methods

-(EVEAssetList *)initWithEveKeyId:(NSString *)keyId
                            VCode:(NSString *)vCode
                      CharacterId:(NSNumber *)characterId
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Asset List";
      [self.uri appendString:@"char/AssetList.xml.aspx"];
      [self.uriArguments addEntriesFromDictionary:@{@"keyID":keyId,
                                                    @"vCode":vCode,
                                                    @"characterID":[characterId stringValue]}];
      self.cakAccessMask = @0;
      self.cacheStyle = kLongCache;
      self.legacyApiRestriction = kFullAccess;
      self.isLegacyApiKeyEnabled = YES;
      
      // Built Object Properties
      self.assets = [NSMutableArray new];
      
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
   NSMutableString *assetList = [NSMutableString stringWithFormat:
           @"%@ - Version %@\n\n"
           @"URI:\t\t\t\t\t\t%@\n"
           @"Legacy API Enabled:\t\t\t%s\n"
           @"Legacy API Restriction:\t\t%@\n"
           @"CAK Access Mask Required:\t%@\n"
           @"Date Last Queried:\t\t\t%@\n"
           @"Cached Until:\t\t\t\t%@\n"
           @"Cache Style:\t\t\t\t%@\n"
           @"API Error:%@\n\n",
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
   
   for (id object in self.assets)
   {
      [assetList appendFormat:@"%@\n", object];
   }
   
   return assetList;
}

#pragma mark - EVEApiProtool Methods

-(void)configureObjectBuilders
{
   EVEAsset *asset = [EVEAsset new];
   [asset setContainedAssetsRelationKeypath:@"rowset.row"];
   
   ObjectBlueprint *assetBP = asset.objectBlueprint;
   [assetBP setXmlKeypath:@"eveapi.result.rowset.row"];
   
   // Add the object blueprints to our array
   [self.objectBlueprints addObject:assetBP];
   
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
      if ([object class] == [EVEAsset class])
      {
         [self.assets addObject:object];
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
