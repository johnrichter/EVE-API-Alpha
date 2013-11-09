//
//  EVEKill.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/8/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEKill.h"
#import "BlueprintRelationship.h"

@interface EVEKill ()

@end

@implementation EVEKill

#pragma mark - Instance Methods

-(EVEKill *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.killId = @0;
      self.solarSystemId = @0;
      self.moonId = @0;
      self.killTime = [EVEDate new];
      self.victim = [EVEKillVictim new];
      self.attackers = [EVEKillAttackers new];
      self.items = [EVEKillItems new];
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"killID":@"killId",
                                                       @"solarSystemID":@"solarSystemId",
                                                       @"moonID":@"moonId",
                                                       @"killTime":@"killTime"}];
}

-(void)setVictimRelationKeypath:(NSString *)keypath
{
   BlueprintRelationship *victim =
      [BlueprintRelationship relationshipFromXmlKeypath:keypath
                           RelativeToObjectWithProperty:@"victim"
                                           ForBlueprint:[[EVEKillVictim new] objectBlueprint]];
   
   [self.objectBlueprint addRelationshipsFromArray:@[victim]];
}

-(void)setAttackersRelationKeypath:(NSString *)attackersKeypath
                MatchingAttributes:(NSDictionary *)attributes
                   AttackerKeypath:(NSString *)attackerKeypath
{
   EVEKillAttackers *attackers = [EVEKillAttackers new];
   [attackers setAttackerRelationKeypath:attackerKeypath];
 
   BlueprintRelationship *attackersRelation =
      [BlueprintRelationship relationshipFromXmlKeypath:attackersKeypath
                                  MatchingXmlAttributes:attributes
                           RelativeToObjectWithProperty:@"attackers"
                                           ForBlueprint:[attackers objectBlueprint]];
   
   [self.objectBlueprint addRelationshipsFromArray:@[attackersRelation]];
}

-(void)setItemsRelationKeypath:(NSString *)itemsKeypath
            MatchingAttributes:(NSDictionary *)attributes
                   ItemKeypath:(NSString *)itemKeypath
         ContainedItemsKeypath:(NSString *)containedKeypath;
{
   EVEKillItems *items = [EVEKillItems new];
   [items setItemRelationKeypath:itemKeypath ContainedItemsKeypath:containedKeypath];
   
   BlueprintRelationship *itemsRelation =
   [BlueprintRelationship relationshipFromXmlKeypath:itemsKeypath
                               MatchingXmlAttributes:attributes
                        RelativeToObjectWithProperty:@"items"
                                        ForBlueprint:[items objectBlueprint]];
   
   [self.objectBlueprint addRelationshipsFromArray:@[itemsRelation]];
}

-(NSString *)description
{
   return [NSString stringWithFormat:
           @"Kill ID: %@ | Solar System ID: %@ | "
           @"Moon ID: %@ | Kill Time: %@\n"
           @"%@\n"
           @"%@\n"
           @"%@",
           self.killId, self.solarSystemId, self.moonId, self.killTime,
           self.victim, self.attackers, self.items];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"killId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"solarSystemId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"moonId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"killTime"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
   else if([key isEqualToString:@"victim"])
   {
      [self setValue:[EVEKillVictim new] forKey:key];
   }
   else if([key isEqualToString:@"attackers"])
   {
      [self setValue:[EVEKillAttackers new] forKey:key];
   }
   else if([key isEqualToString:@"items"])
   {
      [self setValue:[EVEKillItems new] forKey:key];
   }
}

@end
