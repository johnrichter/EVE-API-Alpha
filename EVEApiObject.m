//
//  EVEApi.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"
#import "BlueprintRelationship.h"

@implementation EVEApiObject

-(EVEApiObject *)init
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"";
      self.uri = [NSMutableString stringWithString:@"https://api.eveonline.com/"];
      self.uriArguments = [[NSMutableDictionary alloc] init];
      self.cakAccessMask = @0;
      self.cacheStyle = kLongCache;
      self.legacyApiRestriction = kNotApplicable;
      self.isLegacyApiKeyEnabled = NO;
      
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
   
   
   
   // Add all of our relationships to the main api blueprint
   [_apiBlueprint addRelationshipsFromArray:@[currentTimeRelationship,
                                              cachedUntilRelationship]];
}

@end
