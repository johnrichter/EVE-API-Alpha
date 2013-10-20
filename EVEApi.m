//
//  EVEApi.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/4/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApi.h"
#import "BlueprintRelationship.h"

@implementation EVEApi

-(EVEApi *)init
{
   self = [super init];
   if (self)
   {
      // XML Properties
      self.lastQueried = [EVEDate new];
      self.cachedUntil = [EVEDate new];
      self.apiError = [EVEError new];
      self.apiVersion = @0;
      
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   // Configure the main blueprint for our api object
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributeFrom:@"version" To:@"apiVersion"];
}

-(void)setRelationshipsWithKeypathsForLastQueried:(NSString *)lastQueried
                                      CachedUntil:(NSString *)cachedUntil
                                         ApiError:(NSString *)apiError
{
   // Create the lastQueried relationship
   BlueprintRelationship *currentTimeRelationship =
   [BlueprintRelationship relationshipFromXmlKeypath:lastQueried
                        RelativeToObjectWithProperty:@"lastQueried"
                                        ForBlueprint:[[[EVEDate alloc] init] objectBlueprint]];
   
   // Create the cachedUntil relationship
   BlueprintRelationship *cachedUntilRelationship =
   [BlueprintRelationship relationshipFromXmlKeypath:cachedUntil
                        RelativeToObjectWithProperty:@"cachedUntil"
                                        ForBlueprint:[[[EVEDate alloc] init] objectBlueprint]];
   
   // Create the apiError relationship
   BlueprintRelationship *errorRelationship =
   [BlueprintRelationship relationshipFromXmlKeypath:apiError
                        RelativeToObjectWithProperty:@"apiError"
                                        ForBlueprint:[[[EVEError alloc] init] objectBlueprint]];
   
   // Add both relationships to EVEApi
   [self.objectBlueprint addRelationshipsFromArray:@[currentTimeRelationship,
                                                     cachedUntilRelationship,
                                                     errorRelationship]];
   
}

@end
