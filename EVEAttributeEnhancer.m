//
//  EVEAttributeEnhancer.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEAttributeEnhancer.h"
#import "BlueprintRelationship.h"

@interface EVEAttributeEnhancer ()

@end

@implementation EVEAttributeEnhancer

#pragma mark - Instance Methods

-(EVEAttributeEnhancer *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.enhancerId = [EVEAttributeEnhancerId new];
      self.enhancerName = [EVEAttributeEnhancerName new];
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
}

-(void)setRelationshipsWithEnhancerIdKeypath:(NSString *)idKeypath
                                 NameKeypath:(NSString *)nameKeypath
{
   BlueprintRelationship *idRelationship =
   [BlueprintRelationship relationshipFromXmlKeypath:idKeypath
                        RelativeToObjectWithProperty:@"enhancerId"
                                        ForBlueprint:[[EVEAttributeEnhancerId new] objectBlueprint]];
   
   BlueprintRelationship *nameRelationship =
   [BlueprintRelationship relationshipFromXmlKeypath:nameKeypath
                        RelativeToObjectWithProperty:@"enhancerName"
                                        ForBlueprint:[[EVEAttributeEnhancerName new] objectBlueprint]];
   
   [self.objectBlueprint addRelationshipsFromArray:@[idRelationship, nameRelationship]];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Enhancer Id: %@ | Name: %@",
           self.enhancerId, self.enhancerName];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"enhancerId"])
   {
      [self setValue:[EVEAttributeEnhancerId new] forKey:key];
   }
   else if([key isEqualToString:@"enhancerName"])
   {
      [self setValue:[EVEAttributeEnhancerName new] forKey:key];
   }
}

@end
