//
//  EVECharacterInfo.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECharacterInfo.h"

#import "EVECharacterId.h"
#import "EVECharacterName.h"
#import "EVERace.h"
#import "EVEBloodLine.h"
#import "EVEWalletBalance.h"
#import "EVECloneSkillPoints.h"
#import "EVESkillInTraningEnds.h"
#import "EVEShipName.h"
#import "EVEShipTypeId.h"
#import "EVEShipTypeName.h"
#import "EVECorporationId.h"
#import "EVECorporationName.h"
#import "EVECorporationJoinDate.h"
#import "EVEAllianceId.h"
#import "EVEAllianceName.h"
#import "EVEAllianceJoinDate.h"
#import "EVELastKnownLocation.h"
#import "EVESecurityStatus.h"
#import "EVEEmploymentHistoryRecord.h"

@interface EVECharacterInfo ()

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

@end

@implementation EVECharacterInfo

#pragma mark - Instance Methods

-(EVECharacterInfo *)initWithCharacterId:(NSNumber *)characterId
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Character Info";
      [self.uri appendString:@"eve/CharacterInfo.xml.aspx"];
      [self.uriArguments addEntriesFromDictionary:@{@"characterID":[characterId stringValue]}];
      
      self.cakAccessMask = @0;
      self.cacheStyle = kShortCache;
      
      // Built Object Properties
      self.charId = @0;
      self.charName = @"";
      self.race = @"";
      self.bloodline = @"";
      self.walletBalance = @0;
      self.skillpoints = @0;
      self.skillInTraningEndDate = [EVEDate new];
      self.shipName = @"";
      self.shipTypeId = @0;
      self.shipTypeName = @"";
      self.corporationId = @0;
      self.corporationName = @"";
      self.corpJoinDate = [EVEDate new];
      self.allianceId = @0;
      self.allianceName = @"";
      self.allianceJoinDate = [EVEDate new];
      self.lastKnownLocation = @"";
      self.securityStatus = @0;
      self.employmentHistory = [NSMutableOrderedSet new];
      
      // Instance Properties
      self.keyId = @"";
      self.vCode = @"";
      self.characterId = characterId;
      
      // Object Building Properties
      [self configureObjectBuilders];
   }
   
   return self;
}

-(EVECharacterInfo *)initWithEveKeyId:(NSString *)keyId
                                VCode:(NSString *)vCode
                          CharacterId:(NSNumber *)characterId
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Character Info";
      [self.uri appendString:@"eve/CharacterInfo.xml.aspx"];
      [self.uriArguments addEntriesFromDictionary:@{@"keyID":keyId,
                                                    @"vCode":vCode,
                                                    @"characterID":[characterId stringValue]}];
      self.cakAccessMask = @16777216; // Public --> @8388608
      self.cacheStyle = kShortCache;
      
      // Built Object Properties
      self.charId = @0;
      self.charName = @"";
      self.race = @"";
      self.bloodline = @"";
      self.walletBalance = @0;
      self.skillpoints = @0;
      self.skillInTraningEndDate = [EVEDate new];
      self.shipName = @"";
      self.shipTypeId = @0;
      self.shipTypeName = @"";
      self.corporationId = @0;
      self.corporationName = @"";
      self.corpJoinDate = [EVEDate new];
      self.allianceId = @0;
      self.allianceName = @"";
      self.allianceJoinDate = [EVEDate new];
      self.lastKnownLocation = @"";
      self.securityStatus = @0;
      self.employmentHistory = [NSMutableOrderedSet new];
      
      // Instance Properties
      self.keyId = keyId;
      self.vCode = vCode;
      self.characterId = characterId;
      
      // Object Building Properties
      [self configureObjectBuilders];
   }
   
   return self;
}

-(void)queryTheApi
{
   [self.requestOperation start];
}

-(NSString *)description
{
   NSMutableString *api = [NSMutableString stringWithFormat:
                           @"%@ - Version %@\n\n"
                           @"URI:\t\t\t\t\t\t%@\n"
                           @"Legacy API Enabled:\t\t\t%s\n"
                           @"Legacy API Restriction:\t\t%@\n"
                           @"CAK Access Mask Required:\t%@\n"
                           @"Date Last Queried:\t\t\t%@\n"
                           @"Cached Until:\t\t\t\t%@\n"
                           @"Cache Style:\t\t\t\t%@\n"
                           @"API Error:\t\t\t\t\t%@\n\n",
                           self.commonName,
                           self.apiVersion,
                           self.uri,
                           self.isLegacyApiKeyEnabled ? "Yes":"No",
                           [EVEApiObject legacyApiRestrictionToString:self.legacyApiRestriction],
                           self.cakAccessMask,
                           self.lastQueried,
                           self.cachedUntil,
                           [EVEApiObject cacheStyleToString:self.cacheStyle],
                           self.apiError];
   
   [api appendFormat:@"Character ID: %@\n"
                     @"Character Name: %@\n"
                     @"Race: %@\n"
                     @"Bloodline: %@\n"
                     @"Wallet Balance: %@\n"
                     @"Skillpoints: %@\n"
                     @"Current Skill Finish Date: %@\n"
                     @"Ship Name: %@\n"
                     @"Ship Type ID: %@\n"
                     @"Ship Type Name: %@\n"
                     @"Corporation ID: %@\n"
                     @"Corporation Name: %@\n"
                     @"Corporation Join Date: %@\n"
                     @"Alliance ID: %@\n"
                     @"Alliance Name: %@\n"
                     @"Alliance Join Date: %@\n"
                     @"Last Known Location: %@\n"
                     @"Security Status: %@\n",
                     self.charId, self.charName, self.race, self.bloodline,
                     self.walletBalance, self.skillpoints, self.skillInTraningEndDate,
                     self.shipName, self.shipTypeId, self.shipTypeName,
                     self.corporationId, self.corporationName, self.corpJoinDate,
                     self.allianceId, self.allianceName, self.allianceJoinDate,
                     self.lastKnownLocation, self.securityStatus];
   
   for (id object in self.employmentHistory)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   return api;
}


#pragma mark - EVEApiProtool Methods

-(void)configureObjectBuilders
{
   ObjectBlueprint *charId = [[EVECharacterId new] objectBlueprint];
   [charId setXmlKeypath:@"eveapi.result.characterID"];
   
   ObjectBlueprint *charName = [[EVECharacterName new] objectBlueprint];
   [charName setXmlKeypath:@"eveapi.result.characterName"];
   
   ObjectBlueprint *race = [[EVERace new] objectBlueprint];
   [race setXmlKeypath:@"eveapi.result.race"];
   
   ObjectBlueprint *bloodline = [[EVEBloodLine new] objectBlueprint];
   [bloodline setXmlKeypath:@"eveapi.result.bloodline"];
   
   ObjectBlueprint *walletBalance = [[EVEWalletBalance new] objectBlueprint];
   [walletBalance setXmlKeypath:@"eveapi.result.accountBalance"];
   
   ObjectBlueprint *skillpoints = [[EVECloneSkillPoints new] objectBlueprint];
   [skillpoints setXmlKeypath:@"eveapi.result.skillPoints"];
   
   ObjectBlueprint *skillEndDate = [[EVESkillInTraningEnds new] objectBlueprint];
   [skillEndDate setXmlKeypath:@"eveapi.result.nextTrainingEnds"];
   
   ObjectBlueprint *shipName = [[EVEShipName new] objectBlueprint];
   [shipName setXmlKeypath:@"eveapi.result.shipName"];
   
   ObjectBlueprint *shipTypeId = [[EVEShipTypeId new] objectBlueprint];
   [shipTypeId setXmlKeypath:@"eveapi.result.shipTypeID"];
   
   ObjectBlueprint *shipTypeName = [[EVEShipTypeName new] objectBlueprint];
   [shipTypeName setXmlKeypath:@"eveapi.result.shipTypeName"];
   
   ObjectBlueprint *corpId = [[EVECorporationId new] objectBlueprint];
   [corpId setXmlKeypath:@"eveapi.result.corporationID"];
   
   ObjectBlueprint *corpName = [[EVECorporationName new] objectBlueprint];
   [corpName setXmlKeypath:@"eveapi.result.corporation"];
   
   ObjectBlueprint *corpJoinDate = [[EVECorporationJoinDate new] objectBlueprint];
   [corpJoinDate setXmlKeypath:@"eveapi.result.corporationDate"];
   
   ObjectBlueprint *allianceId = [[EVEAllianceId new] objectBlueprint];
   [allianceId setXmlKeypath:@"eveapi.result.allianceID"];
   
   ObjectBlueprint *allianceName = [[EVEAllianceName new] objectBlueprint];
   [allianceName setXmlKeypath:@"eveapi.result.alliance"];
   
   ObjectBlueprint *allianceJoinDate = [[EVEAllianceJoinDate new] objectBlueprint];
   [allianceJoinDate setXmlKeypath:@"eveapi.result.allianceDate"];
   
   ObjectBlueprint *lastKnownLocation = [[EVELastKnownLocation new] objectBlueprint];
   [lastKnownLocation setXmlKeypath:@"eveapi.result.lastKnownLocation"];
   
   ObjectBlueprint *securityStatus = [[EVESecurityStatus new] objectBlueprint];
   [securityStatus setXmlKeypath:@"eveapi.result.securityStatus"];
   
   ObjectBlueprint *employmentRecord = [[EVEEmploymentHistoryRecord new] objectBlueprint];
   [employmentRecord setXmlKeypath:@"eveapi.result.rowset.row"
                MatchingParentName:@"rowset"
               ParentXmlAttributes:@{@"name":@"employmentHistory"}];
   
   // Add the blueprints to our collection
   [self.objectBlueprints addObjectsFromArray:@[charId, charName, race, bloodline,
                                                walletBalance, skillpoints, skillEndDate,
                                                shipName, shipTypeId, shipTypeName,
                                                corpId, corpName, corpJoinDate,
                                                allianceId, allianceName,
                                                allianceJoinDate, lastKnownLocation,
                                                securityStatus, employmentRecord]];
   
   // Configure our RequestOperation with URI and Arguements
   [self.requestOperation setUrl:self.uri
                  WithArguements:self.uriArguments
                      Blueprints:self.objectBlueprints];
}

#pragma mark - RequestOperationProtocolMethods

-(void)requestOperationSucceededWithObjects:(NSArray *)objects
{
   // Call our base classes protocol function
   [super requestOperationSucceededWithObjects:objects];
   
   for (id object in objects)
   {
      if ([object class] == [EVECharacterId class])
      {
         self.charId = ((EVECharacterId *)object).characterId;
      }
      else if ([object class] == [EVECharacterName class])
      {
         self.charName = ((EVECharacterName *)object).name;
      }
      else if ([object class] == [EVERace class])
      {
         self.race = ((EVERace *)object).race;
      }
      else if ([object class] == [EVEBloodLine class])
      {
         self.bloodline = ((EVEBloodLine *)object).bloodLine;
      }
      else if ([object class] == [EVEWalletBalance class])
      {
         self.walletBalance = ((EVEWalletBalance *)object).walletBalance;
      }
      else if ([object class] == [EVECloneSkillPoints class])
      {
         self.skillpoints = ((EVECloneSkillPoints *)object).skillPoints;
      }
      else if ([object class] == [EVESkillInTraningEnds class])
      {
         self.skillInTraningEndDate = (EVEDate *)object;
      }
      else if ([object class] == [EVEShipName class])
      {
         self.shipName = ((EVEShipName *)object).string;
      }
      else if ([object class] == [EVEShipTypeId class])
      {
         self.shipTypeId = ((EVEShipTypeId *)object).number;
      }
      else if ([object class] == [EVEShipTypeName class])
      {
         self.shipTypeName = ((EVEShipTypeName *)object).string;
      }
      else if ([object class] == [EVECorporationId class])
      {
         self.corporationId = ((EVECorporationId *)object).corporationId;
      }
      else if ([object class] == [EVECorporationName class])
      {
         self.corporationName = ((EVECorporationName *)object).name;
      }
      else if ([object class] == [EVECorporationJoinDate class])
      {
         self.corpJoinDate = (EVEDate *)object;
      }
      else if ([object class] == [EVEAllianceId class])
      {
         self.allianceId = ((EVEAllianceId *)object).allianceId;
      }
      else if ([object class] == [EVEAllianceName class])
      {
         self.allianceName = ((EVEAllianceName *)object).name;
      }
      else if ([object class] == [EVEAllianceJoinDate class])
      {
         self.allianceJoinDate = (EVEDate *)object;
      }
      else if ([object class] == [EVELastKnownLocation class])
      {
         self.lastKnownLocation = ((EVELastKnownLocation *)object).string;
      }
      else if ([object class] == [EVESecurityStatus class])
      {
         self.securityStatus = ((EVESecurityStatus *)object).number;
      }
      else if ([object class] == [EVEEmploymentHistoryRecord class])
      {
         [self.employmentHistory addObject:object];
      }
   }
   
   // Sort the employment history properly
   NSSortDescriptor *sortDesc = [[NSSortDescriptor alloc] initWithKey:@"joinDate"
                                                            ascending:NO];
   [self.employmentHistory sortUsingDescriptors:@[sortDesc]];
   
   [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromClass([self class])
                                                       object:nil
                                                     userInfo:nil];
}

-(void)requestOperationFailedWithError:(NSError *)error;
{
   [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromClass([self class])
                                                       object:nil
                                                     userInfo:@{@"error":error}];
}


@end
