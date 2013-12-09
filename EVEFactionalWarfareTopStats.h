//
//  EVEFactionalWarfareTopStats.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"

@interface EVEFactionalWarfareTopStats : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) NSMutableOrderedSet *pilotKillsYesterday;
@property (strong) NSMutableOrderedSet *pilotKillsLastWeek;
@property (strong) NSMutableOrderedSet *pilotTotalKills;
@property (strong) NSMutableOrderedSet *pilotVictoryPointsYesterday;
@property (strong) NSMutableOrderedSet *pilotVictoryPointsLastWeek;
@property (strong) NSMutableOrderedSet *pilotTotalVictoryPoints;

@property (strong) NSMutableOrderedSet *corpKillsYesterday;
@property (strong) NSMutableOrderedSet *corpKillsLastWeek;
@property (strong) NSMutableOrderedSet *corpTotalKills;
@property (strong) NSMutableOrderedSet *corpVictoryPointsYesterday;
@property (strong) NSMutableOrderedSet *corpVictoryPointsLastWeek;
@property (strong) NSMutableOrderedSet *corpTotalVictoryPoints;

@property (strong) NSMutableOrderedSet *factionKillsYesterday;
@property (strong) NSMutableOrderedSet *factionKillsLastWeek;
@property (strong) NSMutableOrderedSet *factionTotalKills;
@property (strong) NSMutableOrderedSet *factionVictoryPointsYesterday;
@property (strong) NSMutableOrderedSet *factionVictoryPointsLastWeek;
@property (strong) NSMutableOrderedSet *factionTotalVictoryPoints;

#pragma mark - Instance Properties
@property (strong) NSSortDescriptor *killsSortDescriptor;
@property (strong) NSSortDescriptor *victoryPtsSortDescriptor;

#pragma mark - Instance Methods
-(EVEFactionalWarfareTopStats *)init;
-(void)queryTheApi;


@end
