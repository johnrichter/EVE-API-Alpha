//
//  EVEApi.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/4/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEDate.h"
#import "EVEError.h"

@interface EVEApi : EVEObject <EVEObjectProtocol>

#pragma mark - XML Attributes
@property (strong) NSNumber *apiVersion;

#pragma mark - XML Properties
@property (strong) EVEDate *lastQueried;
@property (strong) EVEDate *cachedUntil;
@property (strong) EVEError *apiError;

#pragma mark - EVEObjectProtocol Methods
-(void)configureObjectBlueprint;
-(void)setRelationshipsWithKeypathsForLastQueried:(NSString *)lastQueried
                                      CachedUntil:(NSString *)cachedUntil
                                         ApiError:(NSString *)apiError;

@end
