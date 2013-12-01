//
//  EVEFaction.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/30/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVEFaction : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *factionId;
@property (strong) NSString *factionName;
@property (strong) NSNumber *pilotCount;
@property (strong) NSNumber *systemsControlled;
@property (strong) NSNumber *killsYesterday;
@property (strong) NSNumber *killsLastWeek;
@property (strong) NSNumber *totalKills;
@property (strong) NSNumber *victoryPointsYesterday;
@property (strong) NSNumber *victoryPointsLastWeek;
@property (strong) NSNumber *totalVictoryPoints;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

@end
