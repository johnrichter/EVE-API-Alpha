//
//  BlueprintRelationship.m
//  EveAPI
//
//  Created by Johnathan Richter on 9/26/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "BlueprintRelationship.h"

@implementation BlueprintRelationship

-(BlueprintRelationship *)init
{
   self = [super init];
   if (self)
   {
      self.xmlKeypath = @"";
      self.xmlAttributes = @{};
      self.objectKeypath = @"";
      self.blueprintToBuild = nil;
   }
   
   return self;
}

+(BlueprintRelationship *)relationshipFromXmlKeypath:(NSString *)xmlKeypath
                                     RelativeToObjectWithProperty:(NSString *)objectKeypath
                                        ForBlueprint:(ObjectBlueprint *)blueprint
{
   BlueprintRelationship *newInstance = [[BlueprintRelationship alloc] init];
   
   [newInstance setXmlKeypath:xmlKeypath];
   [newInstance setObjectKeypath:objectKeypath];
   [newInstance setBlueprintToBuild:blueprint];
   
   return newInstance;
}

+(BlueprintRelationship *)relationshipFromXmlKeypath:(NSString *)xmlKeypath
                               MatchingXmlAttributes:(NSDictionary *)xmlAttributes
                        RelativeToObjectWithProperty:(NSString *)objectKeypath
                                        ForBlueprint:(ObjectBlueprint *)blueprint
{
   BlueprintRelationship *newInstance = [[BlueprintRelationship alloc] init];
   
   [newInstance setXmlKeypath:xmlKeypath];
   [newInstance setXmlAttributes:xmlAttributes];
   [newInstance setObjectKeypath:objectKeypath];
   [newInstance setBlueprintToBuild:blueprint];
   
   return newInstance;
}

@end
