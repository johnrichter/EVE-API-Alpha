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
#import "EVEError.h"
#import "RequestOperation.h"
#import "ObjectBlueprint.h"

typedef enum EVECacheStyle : NSUInteger
{
   kShortCache,
   kModifiedShortCache,
   kLongCache
} EVECacheStyle;

typedef enum EVELegacyApiKeyRestriction : NSUInteger
{
   kNotApplicable,
   kNoAccess,
   kFullAccess,
   kLimitedAccess
} EVELegacyApiRestriction;

@interface EVEApiObject : NSObject <RequestOperationDelegate>

#pragma mark - Common API Properties
@property (strong) NSString *commonName;
@property (strong) NSMutableString *uri;
@property (strong) NSMutableDictionary *uriArguments;
@property (strong) NSNumber *cakAccessMask;
@property EVECacheStyle cacheStyle;
@property EVELegacyApiRestriction legacyApiRestriction;
@property BOOL isLegacyApiKeyEnabled;

#pragma mark - Built Object Properties
@property (strong) NSNumber *apiVersion;
@property (strong) EVEDate *lastQueried;
@property (strong) EVEDate *cachedUntil;
@property (strong) EVEError *apiError;

#pragma mark - Object Building Properties
@property (strong) RequestOperation *requestOperation;
@property (strong) NSMutableArray *objectBlueprints;

#pragma mark - EVEApiObjectProtocol Methods
-(void)initializeObjectBuilders;

#pragma mark - RequestOperationProtocol Methods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

#pragma mark - Helper Methods for Printing
+(NSString *)cacheStyleToString:(EVECacheStyle)style;
+(NSString *)legacyApiRestrictionToString:(EVELegacyApiRestriction)restriction;

@end
