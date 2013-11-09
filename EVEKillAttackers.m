//
//  EVEKillAttackeres.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/8/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEKillAttackers.h"
#import "EVEKillAttacker.h"
#import "BlueprintRelationship.h"

@interface EVEKillAttackers ()

@end

@implementation EVEKillAttackers

#pragma mark - Instance Methods

-(EVEKillAttackers *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.attackers = @[];
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
}

-(void)setAttackerRelationKeypath:(NSString *)keypath
{
   BlueprintRelationship *attacker =
      [BlueprintRelationship relationshipFromXmlKeypath:keypath
                           RelativeToObjectWithProperty:@"attackers"
                                           ForBlueprint:[[EVEKillAttacker new] objectBlueprint]];
   
   [self.objectBlueprint addRelationshipsFromArray:@[attacker]];
}

-(NSString *)description
{
   NSMutableString *attackers = [NSMutableString new];
   
   for (id object in self.attackers)
   {
      if ([object isEqual:[self.attackers lastObject]])
      {
         [attackers appendFormat:@"%@", object];
      }
      else
      {
         [attackers appendFormat:@"%@\n", object];
      }
   }
   
   return attackers;
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"attackers"])
   {
      [self setValue:@[] forKey:key];
   }
}

@end
