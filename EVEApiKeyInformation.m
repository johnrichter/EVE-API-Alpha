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

-(EVEApiKeyInformation *)initWithUriArguements:(NSDictionary *)arguements
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"API Key Information";
      [self.uri appendString:@"account/APIKeyInfo.xml.aspx"];
      [self.uriArguments addEntriesFromDictionary:arguements];
      self.cacheStyle = kShortCache;
      
      // Built Object Properties
      self.apiKey = nil;
      
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
   [self.requestOperation setDelegate:self];
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
}

-(void)requestOperationFailedWithError:(NSError *)error;\
{
   
   
}

-(BOOL)queryTheApi
{
   [self.requestOperation start];
   
   return (_apiKey != nil);
}

-(NSString *)description
{
   return [NSString stringWithFormat:
           @"%@\n\n"
           @"CAK Access Mask:        %@\n"
           @"Cache Style:            %@\n"
           @"Legacy API Enabled:     %s"
           @"Legacy API Restriction: %@\n"
           @"API Version:            %@\n"
           @"Date Last Queried:      %@\n"
           @"Cached Until:           %@\n\n"
           @"%@",
           self.commonName, self.cakAccessMask,
           [EVEApiObject cacheStyleToString:self.cacheStyle],
           self.isLegacyApiKeyEnabled ? "YES":"NO",
           [EVEApiObject legacyApiRestrictionToString:self.legacyApiRestriction],
           self.apiVersion, self.lastQueried, self.cachedUntil, self.apiKey];
}

@end
