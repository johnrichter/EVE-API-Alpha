//
//  EVEWalletJournalEntry.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/11/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEDate.h"

@interface EVEWalletJournalEntry : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes

// Date of the transaction
@property (strong) EVEDate *date;

// ID of transaction. Guaranteed to be unique with this page call; Was previously subject
// to renumbering periodically to remain within the limit of a 32bit integer [1]. As of
// 10/01/2010 the values of refID being seen have exceeded this limit, indicating that
// CCP have upgraded this field to a bigint (64bit integer), removing the need for further
// renumbering. Use the last listed refID with the fromID argument to walk the list.
@property (strong) NSNumber *refId;

// Transaction Type (see eve/RefTypes API)
@property (strong) NSNumber *refTypeId;
@property (strong) NSString *refTypeArgumentName;
@property (strong) NSNumber *refTypeArgumentId;
@property (strong) NSString *refTypeReason;

// Name of the first party in the transaction
@property (strong) NSString *firstPartyName;

// Character or Corporation ID of the first party
@property (strong) NSNumber *firstPartyId;

// Name of the second party in the transaction
@property (strong) NSString *secondPartyName;

// Character or Corporation ID of the second party
@property (strong) NSNumber *secondPartyId;

// The amount transferred between parties
@property (strong) NSNumber *amount;

// The overall balance in this wallet, after this transaction.
@property (strong) NSNumber *balance;

// If the row is related to taxation, then this is the CorporationID of who recieved the
// tax. (Should be 'int' but is presented as 'string', as a none taxReceiverID is
// presented with an empty string instead of '0')
@property (strong) NSNumber *taxPaidToReceiverId;

// If the row is related to taxation, then this is the amount of tax paid.
// (Should be 'decimal' but is presented as 'string', as a none taxAmount is presented
// with an empty string instead of '0.0')
@property (strong) NSNumber *taxAmount;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

/**
 
 RefTypeID	RefTypeName	argName1	argID1	reason	comment
 1	 Player Trading	Station name	Station ID		arg describes where the direct player trade took place. See staStations table.
 2	 Market Transaction	transactionID	0		See MarketTransactions API
 10	 Player Donation		0	"DESC: " + user-entered text	The donating player is free to enter text with the transfer, which shows up in the reason column here.
 17	 Bounty Prize	NPC Name	NPC ID		This was replaced with refTypeID 85 when Trinity was released.
 19	 Insurance	Destroyed ship's typeID	0		See invTypes table.
 35	 CSPA	Player name	Player characterID		Player is the person whom you're trying to contact.
 37	 Corporation Account Withdrawl	 Player name that performed corp account withdrawl	 Player's ID	user-entered text	Similar to player donations; the donating corporation is free to enter text with the transfer, which shows up in the reason column here.
 46	 Broker Fee	 EVE System	 1		The market order commission fee for a market transaction. 'ownerName2' indicates to whom the fee was paid to.
 56	 Manufacturing	Job ID	0		See Industry Jobs API.
 63, 64, 71, 72, 73, 74, 79, 80, 81, 82	 Various contract types	Contract ID?	0
 85	 Bounty Prizes		solarSystemID (see mapSolarSystems table)	NPC ID:quantity killed[,id:qty[,...]]	For each type of NPC killed, its typeID is followed by a colon and the quantity killed. These pairs are seperated by commas, and if there are too many (more than about 60 characters' worth) the list is ended with a literal ",..." to indicate that more have been left off the list.
 
 */

@end
