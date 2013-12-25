//
//  EVESkillTree.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVESkillTree.h"
#import "EVESkillGroup.h"

@interface EVESkillTree ()

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

@end

@implementation EVESkillTree

#pragma mark - Instance Methods

-(EVESkillTree *)init;
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"";
      [self.uri appendString:@"eve/SkillTree.xml.aspx"];
      
      self.cakAccessMask = @0;
      self.cacheStyle = kModifiedShortCache;
      
      // Built Object Properties
      self.skillGroups = [NSMutableArray new];
      
      // Instance Properties
      
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
   
   for (id object in self.skillGroups)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   return api;
}

#pragma mark - EVEApiProtool Methods

-(void)configureObjectBuilders
{
   EVESkillGroup *skillGroup = [EVESkillGroup new];
   [skillGroup setRelationKeypathsForSkills:@"rowset.row"
                                Description:@"description"
                                       Rank:@"rank"
                             RequiredSkills:@"rowset.row"
                           PrimaryAttribute:@"requiredAttributes.primaryAttribute"
                         SecondaryAttribute:@"requiredAttributes.secondaryAttribute"
                               SkillBonuses:@"rowset.row"];
   
   ObjectBlueprint *groupBP = [skillGroup objectBlueprint];
   [groupBP setXmlKeypath:@"eveapi.result.rowset.row"
       MatchingParentName:@"rowset"
      ParentXmlAttributes:@{@"name":@"skillGroups"}];
   
   // Add the blueprints to our collection
   [self.objectBlueprints addObjectsFromArray:@[groupBP]];
   
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
      if ([object class] == [EVESkillGroup class])
      {
         [self.skillGroups addObject:object];
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
