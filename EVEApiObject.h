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
} LegacyApiRestriction;

@interface EVEApiObject : NSObject <RequestOperationDelegate>

#pragma mark - Common API Properties
@property (strong) NSString *commonName;
@property (strong) NSMutableString *uri;
@property (strong) NSMutableDictionary *uriArguments;
@property (strong) NSNumber *cakAccessMask;
@property CacheStyle cacheStyle;
@property LegacyApiRestriction legacyApiRestriction;
@property BOOL isLegacyApiKeyEnabled;

#pragma mark - Built Object Properties
@property (strong) NSNumber *apiVersion;
@property (strong) EVEDate *lastQueried;
@property (strong) EVEDate *cachedUntil;

#pragma mark - Object Building Properties
@property (strong) RequestOperation *requestOperation;
@property (strong) NSMutableArray *objectBlueprints;

#pragma mark - EVEApiObjectProtocol Methods
-(void)initializeObjectBuilders;

#pragma mark - RequestOperationProtocol Methods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

#pragma mark - Helper Methods for Printing
+(NSString *)cacheStyleToString:(CacheStyle)style;
+(NSString *)legacyApiRestrictionToString:(LegacyApiRestriction)restriction;

@end
