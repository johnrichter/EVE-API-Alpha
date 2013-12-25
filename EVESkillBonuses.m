//
//  EVESkillBounuses.m
//  EveAPI
//
//  Created by Johnathan Richter on 12/25/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVESkillBonuses.h"
#import "BlueprintRelationship.h"
#import "EVESkillBonus.h"

@interface EVESkillBonuses ()

@end

@implementation EVESkillBonuses

#pragma mark - Instance Methods

-(EVESkillBonuses *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.skillBonuses = @[];
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
}

-(void)setRelationKeypathsForBonuses:(NSString *)bonus
{
   BlueprintRelationship *bonusRel =
      [BlueprintRelationship relationshipFromXmlKeypath:bonus
                           RelativeToObjectWithProperty:@"skillBonsus"
                                           ForBlueprint:[[EVESkillBonus new] objectBlueprint]];
   
   [self.objectBlueprint addRelationshipsFromArray:@[bonusRel]];
}

-(NSString *)description
{
   NSMutableString *bonuses = [NSMutableString new];
   
   for (id object in self.skillBonuses)
   {
      [bonuses appendFormat:@"%@\n", object];
   }
   
   return [bonuses copy];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"skillBonuses"])
   {
      [self setValue:@[] forKey:key];
   }
}

@end
