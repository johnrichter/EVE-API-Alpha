//
//  EVEApi.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEApiProtocol.h"
#import "EVEDate.h"
#import "RequestOperation.h"
#import "ObjectBlueprint.h"

typedef enum CacheStyle : NSUInteger
{
   kShortCache,
   kModifiedShortCache,
   kLongCache
} CacheStyle;

typedef enum LegacyApiKeyRestriction : NSUInteger
{
   kNotApplicable,
   kNoAccess,
   kFullAccess,
   kLimitedAccess
} LegacyApiKeyRestriction;

@interface EVEApiObject : NSObject <EVEApiObjectProtocol>

#pragma mark - Common API Properties
@property (strong) NSString *commonName;
@property (strong) NSMutableString *uri;
@property (strong) NSMutableDictionary *uriArguments;
@property (strong) NSNumber *cakAccessMask;
@property CacheStyle cacheStyle;
@property LegacyApiKeyRestriction legacyApiRestriction;
@property BOOL isLegacyApiKeyEnabled;

#pragma mark - Object Building Properties
@property (strong) RequestOperation *requestOperation;
@property (strong) ObjectBlueprint *apiBlueprint;

@end
