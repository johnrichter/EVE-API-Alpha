//
//  EVESkillGroup.m
//  EveAPI
//
//  Created by Johnathan Richter on 12/10/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVESkillGroup.h"
#import "BlueprintRelationship.h"

#import "EVESkill.h"

@interface EVESkillGroup ()

@end

@implementation EVESkillGroup

#pragma mark - Instance Methods

-(EVESkillGroup *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.groupId = @0;
      self.groupName = @"";
      self.skills = @[];
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"groupID":@"groupId",
                                                       @"groupName":@"groupName"}];
}

-(void)setRelationKeypathsForSkills:(NSString *)skills
                        Description:(NSString *)description
                               Rank:(NSString *)rank
                     RequiredSkills:(NSString *)requiredSkills
                   PrimaryAttribute:(NSString *)primaryAttribute
                 SecondaryAttribute:(NSString *)secondaryAttribute
                       SkillBonuses:(NSString *)skillBonuses
{
   EVESkill *skill = [EVESkill new];
   [skill setRelationKeypathsForDescription:description
                                       Rank:rank
                             RequiredSkills:requiredSkills
                           PrimaryAttribute:primaryAttribute
                         SecondaryAttribute:secondaryAttribute
                               SkillBonuses:skillBonuses];
   
   BlueprintRelationship *skillRelation =
   [BlueprintRelationship relationshipFromXmlKeypath:skills
                        RelativeToObjectWithProperty:@"skills"
                                        ForBlueprint:[skill objectBlueprint]];
   
   // Add relationships to our objectblueprint
   [self.objectBlueprint addRelationshipsFromArray:@[skillRelation]];
}

-(NSString *)description
{
   NSMutableString *group = [NSMutableString stringWithFormat:
                             @"Skill Group ID: %@, Name: %@",
                             self.groupId, self.groupName];
   
   for (id object in self.skills)
   {
      [group appendFormat:@"\n\t%@", object];
   }
   
   return [NSString stringWithString:group];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"groupId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"groupName"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"skills"])
   {
      [self setValue:@[] forKey:key];
   }
}

@end
