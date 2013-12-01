//
//  EVECharacterInfo.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"
#import "EVEDate.h"

@interface EVECharacterInfo : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) NSNumber *charId;
@property (strong) NSString *charName;
@property (strong) NSString *race;
@property (strong) NSString *bloodline;
@property (strong) NSNumber *walletBalance;
@property (strong) NSNumber *skillpoints;
@property (strong) EVEDate *skillInTraningEndDate;
@property (strong) NSString *shipName;
@property (strong) NSNumber *shipTypeId;
@property (strong) NSString *shipTypeName;
@property (strong) NSNumber *corporationId;
@property (strong) NSString *corporationName;
@property (strong) EVEDate * corpJoinDate;
@property (strong) NSNumber *allianceId;
@property (strong) NSString *allianceName;
@property (strong) EVEDate *allianceJoinDate;
@property (strong) NSString *lastKnownLocation;
@property (strong) NSNumber *securityStatus;
@property (strong) NSMutableOrderedSet *employmentHistory;

#pragma mark - Instance Properties
@property (strong) NSString *keyId;
@property (strong) NSString *vCode;
@property (strong) NSNumber *characterId;

#pragma mark - Instance Methods
-(EVECharacterInfo *)initWithCharacterId:(NSNumber *)characterId;
-(EVECharacterInfo *)initWithEveKeyId:(NSString *)keyId
                                VCode:(NSString *)vCode
                          CharacterId:(NSNumber *)characterId;
-(void)queryTheApi;


@end
