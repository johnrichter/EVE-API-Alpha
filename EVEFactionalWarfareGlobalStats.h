//
//  EVEFactionalWarfareGlobalSummary.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/30/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"

@interface EVEFactionalWarfareGlobalStats : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) NSNumber *killsYesterday;
@property (strong) NSNumber *killsLastWeek;
@property (strong) NSNumber *totalKills;
@property (strong) NSNumber *victoryPointsYesterday;
@property (strong) NSNumber *victoryPointsLastWeek;
@property (strong) NSNumber *totalVictoryPoints;
@property (strong) NSMutableArray *factions;
@property (strong) NSMutableArray *factionWars;

#pragma mark - Instance Properties

#pragma mark - Instance Methods
-(EVEFactionalWarfareGlobalStats *)init;
-(void)queryTheApi;


@end
