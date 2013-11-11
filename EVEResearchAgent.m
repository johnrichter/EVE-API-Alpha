//
//  EVEResearchAgent.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/10/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEResearchAgent.h"

@interface EVEResearchAgent ()

@end

@implementation EVEResearchAgent

#pragma mark - Instance Methods

-(EVEResearchAgent *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.agentId = @0;
      self.skillTypeId = @0;
      self.dateResearchStarted = [EVEDate new];
      self.pointsGeneratedPerDay = @0;
      self.pointsRemaining = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"agentID":@"agentId",
                                                       @"skillTypeID":@"skillTypeId",
                                                       @"researchStartDate":@"dateResearchStarted",
                                                       @"pointsPerDay":@"pointsGeneratedPerDay",
                                                       @"remainderPoints":@"pointsRemaining"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Research Agent ID: %@ | Skill Type ID: %@ | "
                                     @"Research Started On: %@ | "
                                     @"Points Generated Per Day: %@ | "
                                     @"Points Remaining: %@",
                                     self.agentId, self.skillTypeId,
                                     self.dateResearchStarted, self.pointsGeneratedPerDay,
                                     self.pointsRemaining];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"agentId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"skillTypeId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"dateResearchStarted"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
   else if([key isEqualToString:@"pointsGeneratedPerDay"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"pointsRemaining"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
