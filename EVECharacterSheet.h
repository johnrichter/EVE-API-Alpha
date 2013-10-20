//
//  EVECharacterSheet.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEApiObject.h"
#import "EVECharacterId.h"
#import "EVECharacterName.h"
#import "EVEDate.h"
#import "EVERace.h"
#import "EVEBloodLine.h"
#import "EVEAncestry.h"
#import "EVEGender.h"
#import "EVECorporationName.h"
#import "EVECorporationId.h"
#import "EVEAllianceName.h"
#import "EVEAllianceId.h"
#import "EVECloneName.h"
#import "EVECloneSkillPoints.h"
#import "EVEWalletBalance.h"
#import "EVEMemoryEnhancer.h"
#import "EVEPerceptionEnhancer.h"
#import "EVEWillpowerEnhancer.h"
#import "EVEIntelligenceEnhancer.h"
#import "EVECharismaEnhancer.h"
#import "EVECharacterIntelligence.h"
#import "EVECharacterMemory.h"
#import "EVECharacterCharisma.h"
#import "EVECharacterPerception.h"
#import "EVECharacterWillpower.h"

@interface EVECharacterSheet : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) EVECharacterId *characterId;
@property (strong) EVECharacterName *characterName;
@property (strong) EVEDate *dateOfBirth;
@property (strong) EVERace *race;
@property (strong) EVEBloodLine *bloodLine;
@property (strong) EVEAncestry *ancestry;
@property (strong) EVEGender *gender;
@property (strong) EVECorporationName *corporationName;
@property (strong) EVECorporationId *corporationId;
@property (strong) EVEAllianceName *allianceName;
@property (strong) EVEAllianceId *allianceId;
@property (strong) EVECloneName *cloneName;
@property (strong) EVECloneSkillPoints *cloneSkillpoints;
@property (strong) EVEWalletBalance *walletBalance;
@property (strong) EVEMemoryEnhancer *memoryEnhancer;
@property (strong) EVEPerceptionEnhancer *perceptionEnhancer;
@property (strong) EVEWillpowerEnhancer *willpowerEnhancer;
@property (strong) EVEIntelligenceEnhancer *intelligenceEnhancer;
@property (strong) EVECharismaEnhancer *charismaEnhancer;
@property (strong) EVECharacterIntelligence *characterIntelligence;
@property (strong) EVECharacterMemory *characterMemory;
@property (strong) EVECharacterCharisma *characterCharisma;
@property (strong) EVECharacterPerception *characterPerception;
@property (strong) EVECharacterWillpower *characterWillpower;
@property (strong) NSMutableArray *skills;
@property (strong) NSMutableArray *certificates;
@property (strong) NSMutableArray *corporationRoles;
@property (strong) NSMutableArray *corporationRolesHQ;
@property (strong) NSMutableArray *corporationRolesBase;
@property (strong) NSMutableArray *corporationRolesOther;
@property (strong) NSMutableArray *corporationTitles;

#pragma mark - Instance Properties
@property (strong) NSString *keyId;
@property (strong) NSString *vCode;
@property (strong) NSNumber *charId;

#pragma mark - Instance Methods
-(EVECharacterSheet *)initWithEveKeyId:(NSString *)keyId
                                 VCode:(NSString *)vCode
                           CharacterId:(NSNumber *)characterId;
-(void)queryTheApi;

@end
