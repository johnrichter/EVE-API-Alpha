//
//  EVEApi.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/4/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEDate.h"

@interface EVEApi : EVEObject <EVEObjectProtocol>

#pragma mark - Common XML Attributes
@property (strong) NSNumber *apiVersion;

#pragma mark - Common XML Properties
@property (strong) EVEDate *lastQueried;
@property (strong) EVEDate *cachedUntil;

#pragma mark - EVEObjectProtocol Methods
-(void)configureObjectBlueprint;

@end
