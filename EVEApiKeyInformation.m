//
//  EVEApiKeyInformation.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/2/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiKeyInformation.h"
#import "EVECharacter.h"

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
      
      // XML Properties
      self.apiKey = [[EVEApiKey alloc] init];
      
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
   
   // Create apiKey to characters relationship
   ObjectBlueprint *character = [[[EVECharacter alloc] init] objectBlueprint];
   
   BlueprintRelationship *charRelationship =
      [BlueprintRelationship relationshipFromXmlKeypath:@"rowset.row"
                           RelativeToObjectWithProperty:@"characters"
                                           ForBlueprint:character];
   
   [apiKey addRelationship:charRelationship];
   
   // Set up self to apiKey relationship
   BlueprintRelationship *apiKeyRelationship =
      [BlueprintRelationship relationshipFromXmlKeypath:@"result.key"
                           RelativeToObjectWithProperty:@"apiKey"
                                           ForBlueprint:apiKey];
   
   [self.apiBlueprint addRelationship:apiKeyRelationship];
   
   // Set our apiBlueprint to construct the correct class
   [self.apiBlueprint setObjectClassId:[self class]];
   
   // Configure our RequestOperation with URI and Arguements
   [self.requestOperation setDelegate:self];
   [self.requestOperation setUrl:[self uri]
                   WithArguments:[self uriArguments]
                      Blueprints:@[[self apiBlueprint]]];
}

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects
{
   for (id object in objects)
   {
      if ([object class] == [self class])
      {
         
      }
   }
}

-(void)requestOperationFailedWithError:(NSError *)error;\
{
   
}

-(BOOL)queryTheApi
{
   BOOL success = NO;
   
   return success;
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@\n\n%@", self.commonName, self.apiKey];
}

@end
