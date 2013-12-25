//
//  EVESkill.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/16/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVESkill.h"
#import "BlueprintRelationship.h"
#import "EVESkillRequirements.h"
#import "EVESkillBonuses.h

@interface EVESkill ()

@end

@implementation EVESkill

#pragma mark - Instance Methods

-(EVESkill *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.typeId = @0;
      self.typeName = @"";
      self.skillpoints = @0;
      self.level = @0;
      self.published = @0;
      self.skillGroupId = @0;
      self.skillDescription = [EVEString new];
      self.rank = [EVENumber new];
      self.requiredSkills = @[];
      self.primaryAttribute = [EVEString new];
      self.secondaryAttribute = [EVEString new];
      self.skillBonuses = @[];
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"typeID":@"typeId",
                                                       @"typeName":@"typeName",
                                                       @"skillpoints":@"skillpoints",
                                                       @"level":@"level",
                                                       @"published":@"published",
                                                       @"groupID":@"skillGroupId"}];
}

-(void)setRelationKeypathsForDescription:(NSString *)description
                                    Rank:(NSString *)rank
                          RequiredSkills:(NSString *)requiredSkills
                        PrimaryAttribute:(NSString *)primaryAttribute
                      SecondaryAttribute:(NSString *)secondaryAttribute
                            SkillBonuses:(NSString *)skillBonuses
{
   BlueprintRelationship *desc =
      [BlueprintRelationship relationshipFromXmlKeypath:description
                           RelativeToObjectWithProperty:@"skillDescription"
                                           ForBlueprint:[[EVEString new] objectBlueprint]];
   
   BlueprintRelationship *skillRank =
   [BlueprintRelationship relationshipFromXmlKeypath:rank
                        RelativeToObjectWithProperty:@"rank"
                                        ForBlueprint:[[EVENumber new] objectBlueprint]];
   
   BlueprintRelationship *primary =
      [BlueprintRelationship relationshipFromXmlKeypath:primaryAttribute
                           RelativeToObjectWithProperty:@"primaryAttribute"
                                           ForBlueprint:[[EVEString new] objectBlueprint]];
   
   BlueprintRelationship *secondary =
      [BlueprintRelationship relationshipFromXmlKeypath:secondaryAttribute
                           RelativeToObjectWithProperty:@"secondaryAttribute"
                                           ForBlueprint:[[EVEString new] objectBlueprint]];
   
   
   
   BlueprintRelationship *skillBonus = ;
   
   
   
   // Add relationships to our blueprint
   [self.objectBlueprint addRelationshipsFromArray:@[desc, skillRank, primary, secondary,
                                                     reqSkills, skillBonus]];
}

-(NSString *)description
{
   NSMutableString *obj = [NSMutableString stringWithFormat:
                           @"Skill Type ID: %@, Type Name: %@, Level: %@, "
                           @"Skillpoints: %@, Published: %@, Skill Group ID: %@ | "
                           @"Rank: %@, Primary Attribute: %@, Secondary Attribute: %@, "
                           @"Description: %@",
                           self.typeId, self.typeName, self.level,
                           self.skillpoints, self.published, self.skillGroupId,
                           self.rank, self.primaryAttribute, self.secondaryAttribute,
                           self.skillDescription];
   
   for (id object in self.skillBonuses)
   {
      [obj appendFormat:@"\n\t%@", object];
   }
   
   for (id object in self.requiredSkills)
   {
      [obj appendFormat:@"\n\t%@", object];
   }
   
   return [NSString stringWithString:obj];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"typeId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"typeName"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"skillpoints"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"level"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"published"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"skillGroupId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"skillDescription"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"requiredSkills"])
   {
      [self setValue:@[] forKey:key];
   }
   else if([key isEqualToString:@"primaryAttribute"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"secondaryAttribute"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"skillBonuses"])
   {
      [self setValue:@[] forKey:key];
   }
}

@end
