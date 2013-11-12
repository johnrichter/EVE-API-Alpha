//
//  EVEWalletTransactionEntry.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/11/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEDate.h"

@interface EVEWalletTransactionEntry : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes

// Date of transaction
@property (strong) EVEDate *date;

// Transaction ID. Guaranteed to be unique with this page call; subject to renumbering
// periodically. Use the last listed transactionID with the beforeTransID argument to
// walk the list
@property (strong) NSNumber *transactionId;

// Number of items bought/sold
@property (strong) NSNumber *quantity;

// Name of item bought/sold
@property (strong) NSString *typeName;

// ID of item. See invTypes table
@property (strong) NSNumber *typeId;

// The amount per unit paid
@property (strong) NSNumber *price;

// Character or corporation ID of the other party. If buying from an NPC corporation,
// see crpNPCCorporations and eveNames
@property (strong) NSNumber *clientId;

// Name of other party
@property (strong) NSString *clientName;

// Station in which the transaction took place. See staStations
@property (strong) NSNumber *stationId;

// Name of the station in which the transaction took place
@property (strong) NSString *stationName;

// "buy" or "sell"
@property (strong) NSString *transactionType;

// "personal" or "corporation"
@property (strong) NSString *transactionFor;

// Wallet Journal refId
@property (strong) NSNumber *journalRefId;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

@end
