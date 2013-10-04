//
//  EVEApi.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApi.h"

@implementation EVEApi

-(EVEApi *)init
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"";
      self.uri = [NSMutableString stringWithString:@"https://api.eveonline.com"];
      self.cakAccessMask = @0;
      self.cacheStyle = kLongCache;
      self.legacyApiRestriction = kNoAccess;
      self.isLegacyApiKeyEnabled = NO;
      
      // Common XML Properties
      self.lastQueried = [[NSDate alloc] init];
      self.lastQueried = [[NSDate alloc] init];
      self.apiVersion = @2;
      
      // Object Building Properties
      [self constructObjectBuilders];
   }
   
   return self;
}

#pragma mark - Initialization Routines
-(void)constructObjectBuilders
{
   self.requestOperation = [[RequestOperation alloc] init];
   self.apiBlueprint = [[ObjectBlueprint alloc] initWithClass:[self class]
                                                      KeyPath:@"eveapi"
                                                   Attributes:@{@"version":@"apiVersion"}];
   // do relationships
}

@end
