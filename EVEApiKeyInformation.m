//
//  EVEApiKeyInformation.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/2/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiKeyInformation.h"
#import "EVECharacter.h"
#import "BlueprintRelationship.h"

@implementation EVEApiKeyInformation

-(EVEApiKeyInformation *)initWithEveKeyId:(NSString *)keyId VCode:(NSString *)vCode
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"API Key Information";
      [self.uri appendString:@"account/APIKeyInfo.xml.aspx"];
      [self.uriArguments addEntriesFromDictionary:@{@"keyID":keyId,
                                                    @"vCode":vCode}];
      self.cacheStyle = kShortCache;
      
      // Built Object Properties
      self.apiKey = [EVEApiKey new];
      
      // Instance Properties
      self.keyId = keyId;
      self.vCode = vCode;
      
      // Object Building Properties
      [self configureObjectBuilders];
   }
   
   return self;
}

#pragma mark - EVEApiProtool Methods

-(void)configureObjectBuilders
{
   // Create the apiKey blueprint
   ObjectBlueprint *apiKey = [[[EVEApiKey alloc] init] objectBlueprint];
   [apiKey setXmlKeypath:@"eveapi.result.key"];
   
   // Create apiKey to characters relationship
   BlueprintRelationship *charRelationship =
      [BlueprintRelationship relationshipFromXmlKeypath:@"rowset.row"
                           RelativeToObjectWithProperty:@"characters"
                                           ForBlueprint:[[[EVECharacter alloc] init] objectBlueprint]];
   
   [apiKey addRelationshipsFromArray:@[charRelationship]];

   // Add the apiKey blueprint to our list
   [self.objectBlueprints addObject:apiKey];
   
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
      if ([object class] == [EVEApiKey class])
      {
         self.apiKey = object;
         break;
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

-(void)queryTheApi
{
   [self.requestOperation start];
}

-(NSString *)description
{
   return [NSString stringWithFormat:
           @"%@ - Version %@\n\n"
           @"URI:\t\t\t\t\t\t%@\n"
           @"Legacy API Enabled:\t\t\t%s\n"
           @"Legacy API Restriction:\t\t%@\n"
           @"CAK Access Mask Required:\t%@\n"
           @"Date Last Queried:\t\t\t%@\n"
           @"Cached Until:\t\t\t\t%@\n"
           @"Cache Style:\t\t\t\t%@\n\n"
           @"%@\n",
           self.commonName,
           self.apiVersion,
           self.uri,
           self.isLegacyApiKeyEnabled ? "Yes":"No",
           [EVEApiObject legacyApiRestrictionToString:self.legacyApiRestriction],
           self.cakAccessMask,
           self.lastQueried,
           self.cachedUntil,
           [EVEApiObject cacheStyleToString:self.cacheStyle],
           self.apiKey];
}

@end
