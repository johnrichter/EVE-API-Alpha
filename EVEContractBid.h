//
//  EVEContractBid.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEBidDate.h"

@interface EVEContractBid : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *bidId;
@property (strong) NSNumber *contractId;
@property (strong) NSNumber *bidderId;
@property (strong) EVEBidDate *dateBidPlaced;
@property (strong) NSNumber *amount;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

@end
