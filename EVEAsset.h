//
//  EVEAsset.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/13/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVEAsset : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes

@property (strong) NSNumber *itemId;
@property (strong) NSNumber *locationId;
@property (strong) NSNumber *typeId;
@property (strong) NSNumber *quantity;
@property (strong) NSNumber *flag;
@property BOOL isNotPackaged;

#pragma mark - XML Relationships

// This object will be populated when the asset being built is a container.
@property (strong) NSArray *containedAssets;

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

-(void)setContainedAssetsRelationKeypath:(NSString *)keypath;

@end
