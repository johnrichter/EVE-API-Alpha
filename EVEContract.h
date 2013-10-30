//
//  EVEContract.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/29/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEDate.h"

@interface EVEContract : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes

// The character/corporation that has accepted the contract.  If assigneeId == acceptorId
// then this is the characterId, otherwise it is a corporation ID.
@property (strong) NSNumber *acceptorId;

// The character or corporation who was assigned to the contract, 0 if none.
@property (strong) NSNumber *assigneeId;

// Can be "Public" or "Private".  The availability can also be set to "My Corporation",
// in that case the availability here is "Private" and the assigneeID is the corporation
// the issuer was a member of when the contract was issued.
@property (strong) NSString *availability;

// Buyout price (for Auctions only)
@property (strong) NSNumber *buyout;

// Collateral price (for Couriers only)
@property (strong) NSNumber *collateral;

// The unique ID for this contract
@property (strong) NSNumber *contractId;

// Date the contract was accepted.  Empty if the contract hasn't been accepted
@property (strong) EVEDate *dateAccepted;

// Date the contract was completed. Empty if the contract hasn't been completed
@property (strong) EVEDate *dateCompleted;

// Expiration date of the contract
@property (strong) EVEDate *dateExpired;

// Create date of the contract
@property (strong) EVEDate *dateIssued;

// The station the courier ends (Courier contracts only)
@property (strong) NSNumber *endStationId;

// 1 if the contract was issued on behalf of the issuer's corporation, 0 otherwise.
@property BOOL onBehalfOfCorp;

// The corporation the issuer was a member of when the contract was issued
@property (strong) NSNumber *issuerCorpId;

// The character who issued the contract
@property (strong) NSNumber *issuerId;

// Number of days to complete the contract
@property (strong) NSNumber *numDays;

// Price of contract (ItemsExchange and Auctions only)
@property (strong) NSNumber *price;

// Reward for completing contract (Courier contracts only)
@property (strong) NSNumber *reward;

// The station the courier starts (Courier contracts only)
@property (strong) NSNumber *startStationId;

// Can be "Outstanding", "InProgress", "CompletedByIssuer", "CompletedByContractor",
//        "Completed",   "Cancelled",  "Rejected", "Failed", "Deleted" or "Reversed".
@property (strong) NSString *status;

// The player-made description (this is "title" in xml)
@property (strong) NSString *contractDescription;

// Can be "ItemExchange", "Auction", "Loan" or "Courier"
@property (strong) NSString *type;

// Volume of items in cubic meters
@property (strong) NSNumber *volume;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

@end
