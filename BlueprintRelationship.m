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
      self.objectKeypath = @"";
      self.blueprintToBuild = nil;
      
      return self;
   }
   else
   {
      return nil;
   }
}

+(BlueprintRelationship *)relationshipFromXmlKeypath:(NSString *)xmlKeypath
                                     ToObjectKeypath:(NSString *)objectKeypath
                                        ForBlueprint:(ObjectBlueprint *)blueprint
{
   BlueprintRelationship *newInstance = [[BlueprintRelationship alloc] init];
   
   [newInstance setXmlKeypath:xmlKeypath];
   [newInstance setObjectKeypath:objectKeypath];
   [newInstance setBlueprintToBuild:blueprint];
   
   return newInstance;
}

@end
