//
//  EVEKillItem.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/8/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVEKillItem : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes

// The typeID of this item, references the invTypes table.
@property (strong) NSNumber *typeId;

// The flag value of this item, refer to Inventory Flags for more information
// Used for determining what is fitted and what is in cargo
@property (strong) NSNumber *flag;
@property (strong) NSNumber *quantityDropped;
@property (strong) NSNumber *quantityDestroyed;

// Value is 2 if the item is a blueprint copy, 0 for all other items,
// including blueprint originals.
@property (strong) NSNumber *singleton;

#pragma mark - XML Relationships
@property (strong) NSArray *containedItems;

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

-(void)setContainedItemsRelationKeypath:(NSString *)keypath;

@end
