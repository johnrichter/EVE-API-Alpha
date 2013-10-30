//
//  EVEContractItem.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/29/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVEContractItem : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *recordId;
@property (strong) NSNumber *typeId;

// The actual quantity
@property (strong) NSNumber *quantity;

// This attribute will only show up if the quantity is a negative number in the DB.
// Negative quantities are in fact codes, -1 indicates that the item is a singleton
// (non-stackable). If the item happens to be a Blueprint, -1 is an Original and -2
// is a Blueprint Copy.
@property (strong) NSNumber *rawQuantity;

@property BOOL isNotPackaged;

// 1 if the contract issuer has submitted this item with the contract,
// 0 if the isser is asking for this item in the contract.
@property BOOL isIncluded;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

@end
