//
//  EVEKillVictim.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/8/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVEKillVictim : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *characterId;
@property (strong) NSString *characterName;
@property (strong) NSNumber *corporationId;
@property (strong) NSString *corporationName;
@property (strong) NSNumber *allianceId;
@property (strong) NSString *allianceName;
@property (strong) NSNumber *factionId;
@property (strong) NSString *factionName;
@property (strong) NSNumber *damageTaken;
@property (strong) NSNumber *shipTypeId;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

@end
