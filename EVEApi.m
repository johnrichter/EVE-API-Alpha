//
//  EVEApi.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApi.h"
#import "BlueprintRelationship.h"

@implementation EVEApi

-(EVEApi *)init
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"";
      self.uri = [NSMutableString stringWithString:@"https://api.eveonline.com"];
      self.uriArguments = [[NSMutableDictionary alloc] init];
      self.cakAccessMask = @0;
      self.cacheStyle = kLongCache;
      self.legacyApiRestriction = kNoAccess;
      self.isLegacyApiKeyEnabled = NO;
      
      // Common XML Properties
      self.lastQueried = [[EVEDate alloc] init];
      self.cachedUntil = [[EVEDate alloc] init];
      self.apiVersion = @2;
      
      // Object Building Properties
      [self configureObjectBuilders];
   }
   
   return self;
}

#pragma mark - Initialization Routines
-(void)configureObjectBuilders
{
   // Create the request operation we will use to download the data
   self.requestOperation = [[RequestOperation alloc] init];
   
   // Create the main blueprint for our api object
   self.apiBlueprint = [[ObjectBlueprint alloc] initWithClass:[self class]
                                                      KeyPath:@"eveapi"
                                                   Attributes:@{@"version":@"apiVersion"}];
   
   // Create our lastQueried relationship
   ObjectBlueprint *currentTime = _lastQueried.objectBlueprint;
   [currentTime setXmlKeypath:@"eveapi.currentTime"];
   
   BlueprintRelationship *currentTimeRelationship =
      [BlueprintRelationship relationshipFromChildElementName:@"currentTime"
                                              ToObjectKeypath:@"lastQueried"
                                                 ForBlueprint:currentTime];
   
   // Create our cachedUntil relationship
   ObjectBlueprint *cachedUntil = _cachedUntil.objectBlueprint;
   [cachedUntil setXmlKeypath:@"eveapi.cachedUntil"];
   
   BlueprintRelationship *cachedUntilRelationship =
   [BlueprintRelationship relationshipFromChildElementName:@"cachedUntil"
                                           ToObjectKeypath:@"cachedUntil"
                                              ForBlueprint:currentTime];
   
   // Add all of our relationships to the main api blueprint
   [_apiBlueprint addRelationshipsFromArray:@[currentTimeRelationship,
                                              cachedUntilRelationship]];
}

@end
