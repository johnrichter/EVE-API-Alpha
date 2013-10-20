//
//  EVECharacterSheet.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECharacterSheet.h"
#import "EVESkill.h"
#import "EVECertificate.h"
#import "EVECorporationRole.h"
#import "EVECorporationRoleHQ.h"
#import "EVECorporationRoleBase.h"
#import "EVECorporationRoleOther.h"
#import "EVECorporationTitle.h"

@interface EVECharacterSheet ()

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

@end

@implementation EVECharacterSheet

#pragma mark - Instance Methods

-(EVECharacterSheet *)initWithEveKeyId:(NSString *)keyId
                                 VCode:(NSString *)vCode
                           CharacterId:(NSNumber *)characterId
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Character Sheet";
      [self.uri appendString:@"char/CharacterSheet.xml.aspx"];
      [self.uriArguments addEntriesFromDictionary:@{@"keyID":keyId,
                                                    @"vCode":vCode,
                                                    @"characterID":[characterId stringValue]}];
      self.cakAccessMask = @8;
      self.cacheStyle = kModifiedShortCache;
      self.legacyApiRestriction = kLimitedAccess;
      self.isLegacyApiKeyEnabled = YES;
      
      // Built Object Properties
      self.characterId = [EVECharacterId new];
      self.characterName = [EVECharacterName new];
      self.dateOfBirth = [EVEDate new];
      self.race = [EVERace new];
      self.bloodLine = [EVEBloodLine new];
      self.ancestry = [EVEAncestry new];
      self.gender = [EVEGender new];
      self.corporationName = [EVECorporationName new];
      self.corporationId = [EVECorporationId new];
      self.allianceName = [EVEAllianceName new];
      self.allianceId = [EVEAllianceId new];
      self.cloneName = [EVECloneName new];
      self.cloneSkillpoints = [EVECloneSkillPoints new];
      self.walletBalance = [EVEWalletBalance new];
      self.memoryEnhancer = [EVEMemoryEnhancer new];
      self.perceptionEnhancer = [EVEPerceptionEnhancer new];
      self.willpowerEnhancer = [EVEWillpowerEnhancer new];
      self.intelligenceEnhancer = [EVEIntelligenceEnhancer new];
      self.charismaEnhancer = [EVECharismaEnhancer new];
      self.characterIntelligence = [EVECharacterIntelligence new];
      self.characterMemory = [EVECharacterMemory new];
      self.characterCharisma = [EVECharacterCharisma new];
      self.characterPerception = [EVECharacterPerception new];
      self.characterWillpower = [EVECharacterWillpower new];
      self.skills = [NSMutableArray new];
      self.certificates = [NSMutableArray new];
      self.corporationRoles = [NSMutableArray new];
      self.corporationRolesHQ = [NSMutableArray new];
      self.corporationRolesBase = [NSMutableArray new];
      self.corporationRolesOther = [NSMutableArray new];
      self.corporationTitles = [NSMutableArray new];
      
      // Instance Properties
      self.keyId = keyId;
      self.vCode = vCode;
      self.charId = characterId;
      
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
            @"API Error:\t\t\t\t\t%@\n\n"
            @"Character ID: %@\n"
            @"Character Name: %@\n"
            @"Date of Birth: %@\n"
            @"Race: %@\n"
            @"Blood Line: %@\n"
            @"Ancestry: %@\n"
            @"Gender: %@\n"
            @"Corporation Name: %@\n"
            @"Corporation ID: %@\n"
            @"Alliance Name: %@\n"
            @"Alliance ID: %@\n"
            @"Clone Name: %@\n"
            @"Clone Skillpoints: %@\n"
            @"%@\n"
            @"%@\n"
            @"%@\n"
            @"%@\n"
            @"%@\n"
            @"%@\n"
            @"%@\n"
            @"%@\n"
            @"%@\n"
            @"%@\n"
            @"%@\n",
            self.commonName,
            self.apiVersion,
            self.uri,
            self.isLegacyApiKeyEnabled ? "Yes":"No",
            [EVEApiObject legacyApiRestrictionToString:self.legacyApiRestriction],
            self.cakAccessMask,
            self.lastQueried,
            self.cachedUntil,
            [EVEApiObject cacheStyleToString:self.cacheStyle],
            self.apiError,
            self.characterId,
            self.characterName,
            self.dateOfBirth,
            self.race,
            self.bloodLine,
            self.ancestry,
            self.gender,
            self.corporationName,
            self.corporationId,
            self.allianceName,
            self.allianceId,
            self.cloneName,
            self.cloneSkillpoints,
            self.walletBalance,
            self.memoryEnhancer,
            self.perceptionEnhancer,
            self.willpowerEnhancer,
            self.intelligenceEnhancer,
            self.charismaEnhancer,
            self.characterIntelligence,
            self.characterMemory,
            self.characterCharisma,
            self.characterPerception,
            self.characterWillpower];
   
   for (id object in self.skills)
   {
      [api appendFormat:@"Skill: %@\n", object];
   }
   
   for (id object in self.certificates)
   {
      [api appendFormat:@"Certificate: %@\n", object];
   }
   
   for (id object in self.corporationRoles)
   {
      [api appendFormat:@"Corporation Role: %@\n", object];
   }
   
   for (id object in self.corporationRolesHQ)
   {
      [api appendFormat:@"Corporation Role At HQ: %@\n", object];
   }
   
   for (id object in self.corporationRolesBase)
   {
      [api appendFormat:@"Corporation Role At Base: %@\n", object];
   }
   
   for (id object in self.corporationRolesOther)
   {
      [api appendFormat:@"Corporation Role At Other: %@\n", object];
   }
   
   for (id object in self.corporationTitles)
   {
      [api appendFormat:@"Corporation Title: %@\n", object];
   }
   
   return api;
}

#pragma mark - EVEApiProtool Methods

-(void)configureObjectBuilders
{
   ObjectBlueprint *characterId = [[EVECharacterId new] objectBlueprint];
   [characterId setXmlKeypath:@"eveapi.result.characterID"];
   
   ObjectBlueprint *characterName = [[EVECharacterName new] objectBlueprint];
   [characterName setXmlKeypath:@"eveapi.result.name"];
   
   ObjectBlueprint *dateOfBirth = [[EVEDate new] objectBlueprint];
   [dateOfBirth setXmlKeypath:@"eveapi.result.DoB"];
   
   ObjectBlueprint *race = [[EVERace new] objectBlueprint];
   [race setXmlKeypath:@"eveapi.result.race"];
   
   ObjectBlueprint *bloodLine = [[EVEBloodLine new] objectBlueprint];
   [bloodLine setXmlKeypath:@"eveapi.result.bloodLine"];
   
   ObjectBlueprint *ancestry = [[EVEAncestry new] objectBlueprint];
   [ancestry setXmlKeypath:@"eveapi.result.ancestry"];
   
   ObjectBlueprint *gender = [[EVEGender new] objectBlueprint];
   [gender setXmlKeypath:@"eveapi.result.gender"];
   
   ObjectBlueprint *corporationName = [[EVECorporationName new] objectBlueprint];
   [corporationName setXmlKeypath:@"eveapi.result.corporationName"];
   
   ObjectBlueprint *corporationId = [[EVECorporationId new] objectBlueprint];
   [corporationId setXmlKeypath:@"eveapi.result.corporationID"];
   
   ObjectBlueprint *allianceName = [[EVEAllianceName new] objectBlueprint];
   [allianceName setXmlKeypath:@"eveapi.result.allianceName"];
   
   ObjectBlueprint *allianceId = [[EVEAllianceId new] objectBlueprint];
   [allianceId setXmlKeypath:@"eveapi.result.allianceID"];
   
   ObjectBlueprint *cloneName = [[EVECloneName new] objectBlueprint];
   [cloneName setXmlKeypath:@"eveapi.result.cloneName"];
   
   ObjectBlueprint *cloneSkillpoints = [[EVECloneSkillPoints new] objectBlueprint];
   [cloneSkillpoints setXmlKeypath:@"eveapi.result.cloneSkillPoints"];
   
   ObjectBlueprint *walletBalance = [[EVEWalletBalance new] objectBlueprint];
   [walletBalance setXmlKeypath:@"eveapi.result.balance"];
   
   EVEMemoryEnhancer *memoryEnhancer = [EVEMemoryEnhancer new];
   [memoryEnhancer setRelationshipsWithEnhancerValueKeypath:@"augmentatorValue"
                                                NameKeypath:@"augmentatorName"];
   [memoryEnhancer.objectBlueprint setXmlKeypath:@"eveapi.result.attributeEnhancers.memoryBonus"];
   
   EVEPerceptionEnhancer *perceptionEnhancer = [EVEPerceptionEnhancer new];
   [perceptionEnhancer setRelationshipsWithEnhancerValueKeypath:@"augmentatorValue"
                                                    NameKeypath:@"augmentatorName"];
   [perceptionEnhancer.objectBlueprint setXmlKeypath:@"eveapi.result.attributeEnhancers.perceptionBonus"];
   
   EVEWillpowerEnhancer *willpowerEnhancer = [EVEWillpowerEnhancer new];
   [willpowerEnhancer setRelationshipsWithEnhancerValueKeypath:@"augmentatorValue"
                                                   NameKeypath:@"augmentatorName"];
   [willpowerEnhancer.objectBlueprint setXmlKeypath:@"eveapi.result.attributeEnhancers.willpowerBonus"];

   EVEIntelligenceEnhancer *intelligenceEnhancer = [EVEIntelligenceEnhancer new];
   [intelligenceEnhancer setRelationshipsWithEnhancerValueKeypath:@"augmentatorValue"
                                                      NameKeypath:@"augmentatorName"];
   [intelligenceEnhancer.objectBlueprint setXmlKeypath:@"eveapi.result.attributeEnhancers.intelligenceBonus"];
   
   EVECharismaEnhancer *charismaEnhancer = [EVECharismaEnhancer new];
   [charismaEnhancer setRelationshipsWithEnhancerValueKeypath:@"augmentatorValue"
                                                  NameKeypath:@"augmentatorName"];
   [charismaEnhancer.objectBlueprint setXmlKeypath:@"eveapi.result.attributeEnhancers.charismaBonus"];
   
   ObjectBlueprint *characterIntelligence = [[EVECharacterIntelligence new] objectBlueprint];
   [characterIntelligence setXmlKeypath:@"eveapi.result.attributes.intelligence"];
   
   ObjectBlueprint *characterMemory = [[EVECharacterMemory new] objectBlueprint];
   [characterMemory setXmlKeypath:@"eveapi.result.attributes.memory"];
   
   ObjectBlueprint *characterCharisma = [[EVECharacterCharisma new] objectBlueprint];
   [characterCharisma setXmlKeypath:@"eveapi.result.attributes.charisma"];
   
   ObjectBlueprint *characterPerception = [[EVECharacterPerception new] objectBlueprint];
   [characterPerception setXmlKeypath:@"eveapi.result.attributes.perception"];
   
   ObjectBlueprint *characterWillpower = [[EVECharacterWillpower new] objectBlueprint];
   [characterWillpower setXmlKeypath:@"eveapi.result.attributes.willpower"];
   
   ObjectBlueprint *skill = [[EVESkill new] objectBlueprint];
   [skill setXmlKeypath:@"eveapi.result.rowset.row"];
   [skill addParentXmlAttributeFrom:@"name" To:@"skills"];
   
   ObjectBlueprint *certificate = [[EVECertificate new] objectBlueprint];
   [certificate setXmlKeypath:@"eveapi.result.rowset.row"];
   [certificate addParentXmlAttributeFrom:@"name" To:@"certificates"];
   
   ObjectBlueprint *corpRole = [[EVECorporationRole new] objectBlueprint];
   [corpRole setXmlKeypath:@"eveapi.result.rowset.row"];
   [corpRole addParentXmlAttributeFrom:@"name" To:@"corporationRoles"];
   
   ObjectBlueprint *corpRoleHQ = [[EVECorporationRoleHQ new] objectBlueprint];
   [corpRoleHQ setXmlKeypath:@"eveapi.result.rowset.row"];
   [corpRoleHQ addParentXmlAttributeFrom:@"name" To:@"corporationRolesAtHQ"];
   
   ObjectBlueprint *corpRoleBase = [[EVECorporationRoleBase new] objectBlueprint];
   [corpRoleBase setXmlKeypath:@"eveapi.result.rowset.row"];
   [corpRoleBase addParentXmlAttributeFrom:@"name" To:@"corporationRolesAtBase"];
   
   ObjectBlueprint *corpRoleOther = [[EVECorporationRoleOther new] objectBlueprint];
   [corpRoleOther setXmlKeypath:@"eveapi.result.rowset.row"];
   [corpRoleOther addParentXmlAttributeFrom:@"name" To:@"corporationRolesAtOther"];
   
   ObjectBlueprint *corpTitle = [[EVECorporationTitle new] objectBlueprint];
   [corpTitle setXmlKeypath:@"eveapi.result.rowset.row"];
   [corpTitle addParentXmlAttributeFrom:@"name" To:@"corporationTitles"];
   
   // Add the objects to our object collection
   [self.objectBlueprints addObjectsFromArray:@[characterId,
                                                characterName,
                                                dateOfBirth,
                                                race,
                                                bloodLine,
                                                ancestry,
                                                gender,
                                                corporationId,
                                                corporationName,
                                                allianceName,
                                                allianceId,
                                                cloneName,
                                                cloneSkillpoints,
                                                walletBalance,
                                                memoryEnhancer.objectBlueprint,
                                                perceptionEnhancer.objectBlueprint,
                                                willpowerEnhancer.objectBlueprint,
                                                intelligenceEnhancer.objectBlueprint,
                                                charismaEnhancer.objectBlueprint,
                                                characterIntelligence,
                                                characterMemory,
                                                characterCharisma,
                                                characterPerception,
                                                characterWillpower,
                                                skill,
                                                certificate,
                                                corpRole,
                                                corpRoleHQ,
                                                corpRoleBase,
                                                corpRoleOther,
                                                corpTitle]];
   
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
         self.characterId = object;
      }
      else if ([object class] == [EVECharacterName class])
      {
         self.characterName = object;
      }
      else if ([object class] == [EVEDate class]) //DoB
      {
         self.dateOfBirth = object;
      }
      else if ([object class] == [EVERace class])
      {
         self.race = object;
      }
      else if ([object class] == [EVEBloodLine class])
      {
         self.bloodLine = object;
      }
      else if ([object class] == [EVEAncestry class])
      {
         self.ancestry = object;
      }
      else if ([object class] == [EVEGender class])
      {
         self.gender = object;
      }
      else if ([object class] == [EVECorporationName class])
      {
         self.corporationName = object;
      }
      else if ([object class] == [EVECorporationId class])
      {
         self.corporationId = object;
      }
      else if ([object class] == [EVEAllianceName class])
      {
         self.allianceName = object;
      }
      else if ([object class] == [EVEAllianceId class])
      {
         self.allianceId = object;
      }
      else if ([object class] == [EVECloneName class])
      {
         self.cloneName = object;
      }
      else if ([object class] == [EVECloneSkillPoints class])
      {
         self.cloneSkillpoints = object;
      }
      else if ([object class] == [EVEWalletBalance class])
      {
         self.walletBalance = object;
      }
      else if ([object class] == [EVEMemoryEnhancer class])
      {
         self.memoryEnhancer = object;
      }
      else if ([object class] == [EVEPerceptionEnhancer class])
      {
         self.perceptionEnhancer = object;
      }
      else if ([object class] == [EVEWillpowerEnhancer class])
      {
         self.willpowerEnhancer = object;
      }
      else if ([object class] == [EVEIntelligenceEnhancer class])
      {
         self.intelligenceEnhancer = object;
      }
      else if ([object class] == [EVECharismaEnhancer class])
      {
         self.charismaEnhancer = object;
      }
      else if ([object class] == [EVECharacterIntelligence class])
      {
         self.characterIntelligence = object;
      }
      else if ([object class] == [EVECharacterMemory class])
      {
         self.characterMemory = object;
      }
      else if ([object class] == [EVECharacterCharisma class])
      {
         self.characterCharisma = object;
      }
      else if ([object class] == [EVECharacterPerception class])
      {
         self.characterPerception = object;
      }
      else if ([object class] == [EVECharacterWillpower class])
      {
         self.characterWillpower = object;
      }
      else if ([object class] == [EVESkill class])
      {
         [self.skills addObject:object];
      }
      else if ([object class] == [EVECertificate class])
      {
         [self.certificates addObject:object];
      }
      else if ([object class] == [EVECorporationRole class])
      {
         [self.corporationRoles addObject:object];
      }
      else if ([object class] == [EVECorporationRoleHQ class])
      {
         [self.corporationRolesHQ addObject:object];
      }
      else if ([object class] == [EVECorporationRoleBase class])
      {
         [self.corporationRolesBase addObject:object];
      }
      else if ([object class] == [EVECorporationRoleOther class])
      {
         [self.corporationRolesOther addObject:object];
      }
      else if ([object class] == [EVECorporationTitle class])
      {
         [self.corporationTitles addObject:object];
      }
   }
   
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
