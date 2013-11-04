//
//  EVEFactionalWarefareStats.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEApiObject.h"

@interface EVEFactionalWarfareStats : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) NSNumber *factionId;
@property (strong) NSString *factionName;
@property (strong) NSDate *dateEnlisted;
@property (strong) NSNumber *currentRank;
@property (strong) NSNumber *highestRank;
@property (strong) NSNumber *killsYesterday;
@property (strong) NSNumber *killsLastWeek;
@property (strong) NSNumber *totalKills;
@property (strong) NSNumber *victoryPointsYesterday;
@property (strong) NSNumber *victoryPointsLastWeek;
@property (strong) NSNumber *totalVictoryPoints;

#pragma mark - Instance Properties
@property (strong) NSString *keyId;
@property (strong) NSString *vCode;
@property (strong) NSNumber *characterId;

#pragma mark - Instance Methods
-(EVEFactionalWarfareStats *)initWithEveKeyId:(NSString *)keyId
                                        VCode:(NSString *)vCode
                                  CharacterId:(NSNumber *)characterId;
-(void)queryTheApi;

@end
