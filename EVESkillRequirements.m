//
//  EVESkillRequirements.m
//  EveAPI
//
//  Created by Johnathan Richter on 12/25/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVESkillRequirements.h"
#import "EVESkillRequirement.h"
#import "BlueprintRelationship.h"

@interface EVESkillRequirements ()

@end

@implementation EVESkillRequirements

#pragma mark - Instance Methods

-(EVESkillRequirements *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.requiredSkills = @[];
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
}

-(void)setRelationKeypathsForRequirements:(NSString *)reqs
{
   BlueprintRelationship *reqRel =
      [BlueprintRelationship relationshipFromXmlKeypath:reqs
                           RelativeToObjectWithProperty:@"requiredSkills"
                                           ForBlueprint:[[EVESkillRequirement new] objectBlueprint]];
   
   [self.objectBlueprint addRelationshipsFromArray:@[reqRel]];
}

-(NSString *)description
{
   NSMutableString *reqs = [NSMutableString new];
   
   for (id object in self.requiredSkills)
   {
      [reqs appendFormat:@"%@\n", object];
   }
   
   return [reqs copy];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"requiredSkills"])
   {
      [self setValue:@[] forKey:key];
   }
}

@end
