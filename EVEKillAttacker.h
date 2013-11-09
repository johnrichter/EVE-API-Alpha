//
//  EVEKillAttacker.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/8/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVEKillAttacker : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes

// Character's ID. Can be 0 in which case this kill was not done by a character and
// instead was done by a corporation. In the victim case, this implies it is a structure
// loss.
@property (strong) NSNumber *characterId;
@property (strong) NSString *characterName;

@property (strong) NSNumber *corporationId;
@property (strong) NSString *corporationName;

// If not 0, this is the ID of the alliance the corporation belongs to
@property (strong) NSNumber *allianceId;
@property (strong) NSString *allianceName;

// If not 0, this is the ID of the faction the corporation belongs to
@property (strong) NSNumber *factionId;
@property (strong) NSString *factionName;

// The security status of the aggressor at the time of this kill
@property (strong) NSNumber *securityStatus;
@property (strong) NSNumber *damageDone;
@property (strong) NSNumber *weaponTypeId;

// What ship the attacker was flying. If this attacker is a corporation, this could be
// something other than a ship.
@property (strong) NSNumber *shipTypeId;
@property BOOL finalBlow;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

@end
