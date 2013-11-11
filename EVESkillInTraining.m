//
//  EVESkillInTraining.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVESkillInTraining.h"
#import "EVESkillTrainingTQDate.h"
#import "EVESkillTrainingEndDate.h"
#import "EVESkillTrainingStartDate.h"
#import "EVESkillTrainingTypeId.h"
#import "EVESkillTrainingStartSp.h"
#import "EVESkillTrainingEndSp.h"
#import "EVESkillTrainingToLevel.h"
#import "EVESkillTraining.h"

@interface EVESkillInTraining ()

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

@end

@implementation EVESkillInTraining

#pragma mark - Instance Methods

-(EVESkillInTraining *)initWithEveKeyId:(NSString *)keyId
                                  VCode:(NSString *)vCode
                            CharacterId:(NSNumber *)characterId
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Skill in Training";
      [self.uri appendString:@"char/SkillInTraining.xml.aspx"];
      [self.uriArguments addEntriesFromDictionary:@{@"keyID":keyId,
                                                    @"vCode":vCode,
                                                    @"characterID":[characterId stringValue]}];
      self.cakAccessMask = @131072;
      self.cacheStyle = kShortCache;
      self.legacyApiRestriction = kFullAccess;
      self.isLegacyApiKeyEnabled = NO;
      
      // Built Object Properties
      
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
   
   [api appendFormat:@"Is Training a Skill: %s\n", self.isTraining ? "Yes":"No"];
   [api appendFormat:@"%@\n", self.tqDate];
   [api appendFormat:@"%@\n", self.endDate];
   [api appendFormat:@"%@\n", self.startDate];
   [api appendFormat:@"Type ID: %@\n", self.typeId];
   [api appendFormat:@"Start SP: %@\n", self.startSp];
   [api appendFormat:@"End SP: %@\n", self.endSp];
   [api appendFormat:@"To Level: %@\n", self.toLevel];
   
   return api;
}


#pragma mark - EVEApiProtool Methods

-(void)configureObjectBuilders
{
   ObjectBlueprint *tqTime = [[EVESkillTrainingTQDate new] objectBlueprint];
   [tqTime setXmlKeypath:@"eveapi.result.currentTQTime"];
   
   ObjectBlueprint *endTime = [[EVESkillTrainingEndDate new] objectBlueprint];
   [endTime setXmlKeypath:@"eveapi.result.trainingEndTime"];
   
   ObjectBlueprint *startTime = [[EVESkillTrainingStartDate new] objectBlueprint];
   [startTime setXmlKeypath:@"eveapi.result.trainingStartTime"];
   
   ObjectBlueprint *typeId = [[EVESkillTrainingTypeId new] objectBlueprint];
   [typeId setXmlKeypath:@"eveapi.result.trainingTypeID"];
   
   ObjectBlueprint *startSp = [[EVESkillTrainingStartSp new] objectBlueprint];
   [startSp setXmlKeypath:@"eveapi.result.trainingStartSP"];
   
   ObjectBlueprint *endSp = [[EVESkillTrainingEndSp new] objectBlueprint];
   [endSp setXmlKeypath:@"eveapi.result.trainingDestinationSP"];
   
   ObjectBlueprint *toLevel = [[EVESkillTrainingToLevel new] objectBlueprint];
   [toLevel setXmlKeypath:@"eveapi.result.trainingToLevel"];
   
   ObjectBlueprint *skillInTraining = [[EVESkillTraining new] objectBlueprint];
   [skillInTraining setXmlKeypath:@"eveapi.result.skillInTraining"];
   
   // Add the blueprints to our collection
   [self.objectBlueprints addObjectsFromArray:@[tqTime, endTime, startTime, typeId,
                                                startSp, endSp, toLevel, skillInTraining]];
   
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
      if ([object class] == [EVESkillTrainingTQDate class])
      {
         self.tqDate = (EVEDate *)object;
      }
      else if ([object class] == [EVESkillTrainingEndDate class])
      {
         self.endDate = (EVEDate *)object;
      }
      else if ([object class] == [EVESkillTrainingStartDate class])
      {
         self.startDate = (EVEDate *)object;
      }
      else if ([object class] == [EVESkillTrainingTypeId class])
      {
         self.typeId = ((EVESkillTrainingTypeId *)object).number;
      }
      else if ([object class] == [EVESkillTrainingStartSp class])
      {
         self.startSp = ((EVESkillTrainingStartSp *)object).number;
      }
      else if ([object class] == [EVESkillTrainingEndSp class])
      {
         self.endSp = ((EVESkillTrainingEndSp *)object).number;
      }
      else if ([object class] == [EVESkillTrainingToLevel class])
      {
         self.toLevel = ((EVESkillTrainingToLevel *)object).number;
      }
      else if ([object class] == [EVESkillTraining class])
      {
         self.isTraining = ((EVESkillTraining *)object).boolValue;
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
