//
//  EVEApi.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"
#import "BlueprintRelationship.h"
#import "EVEApi.h"

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
      
      // Built Object Properties
      self.apiVersion = @0;
      self.lastQueried = [EVEDate new];
      self.cachedUntil = [EVEDate new];
      self.apiError = [EVEError new];
      
      // Object Building Properties
      [self initializeObjectBuilders];
   }
   
   return self;
}

#pragma mark - EVEApiObjectProtocol Methods

-(void)initializeObjectBuilders
{
   // Create the request operation we will use to download the data
   self.requestOperation = [[RequestOperation alloc] initWithDelegate:self];
   
   // Set up EVEApi object blueprint and relationships
   EVEApi *eveapi = [EVEApi new];
   [eveapi setRelationshipsWithKeypathsForLastQueried:@"currentTime"
                                          CachedUntil:@"cachedUntil"
                                             ApiError:@"error"];
   [eveapi.objectBlueprint setXmlKeypath:@"eveapi"];
   
   // Add all of our object blueprints to our object
   self.objectBlueprints = [NSMutableArray arrayWithObject:eveapi.objectBlueprint];
}

#pragma mark - RequestOperationProtocol Methods

-(void)requestOperationSucceededWithObjects:(NSArray *)objects
{
   for (id object in objects)
   {
      if ([object class] == [EVEApi class])
      {
         self.apiVersion = [object apiVersion];
         self.lastQueried = [object lastQueried];
         self.cachedUntil = [object cachedUntil];
         self.apiError = [object apiError];
         
         // Break out of the loop for efficiency since we only are looking for one object
         break;
      }
   }
}

-(void)requestOperationFailedWithError:(NSError *)error;
{
   // Do nothing for now.
}

#pragma mark - Helper Methods for Printing

+(NSString *)cacheStyleToString:(EVECacheStyle)style
{
   switch (style)
   {
      case kShortCache:
         return @"Short Cache";
         
      case kModifiedShortCache:
         return @"Modified Short Cache";
         
      case kLongCache:
         return @"Long Cache";
         
      default:
         return @"Invalid Cache Style";
   }
}

+(NSString *)legacyApiRestrictionToString:(EVELegacyApiRestriction)restriction
{
   switch (restriction)
   {
      case kNotApplicable:
         return @"N/A";
      
      case kNoAccess:
         return @"No Access";
         
      case kLimitedAccess:
         return @"Limited Access";
         
      case kFullAccess:
         return @"Full Access";
         
      default:
         return @"Invalid Legacy API Restriction";
   }
}

@end
