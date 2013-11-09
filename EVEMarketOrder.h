//
//  EVEMarketOrder.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/8/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEDate.h"

@interface EVEMarketOrder : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *orderId;
@property (strong) NSNumber *characterId;
@property (strong) NSNumber *stationId;
@property (strong) NSNumber *quantityEntered;
@property (strong) NSNumber *quantityRemaining;
@property (strong) NSNumber *minimumQuantity;
@property (strong) NSNumber *orderState;
@property (strong) NSNumber *typeId;
@property (strong) NSNumber *range;
@property (strong) NSNumber *walletKey;
@property (strong) NSNumber *duration;
@property (strong) NSNumber *iskInEscrow;
@property (strong) NSNumber *pricePerUnit;
@property (strong) EVEDate *orderCreationDate;
@property BOOL isBuyOrder;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

@end
