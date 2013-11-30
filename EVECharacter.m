//
//  EVECharacter.m
//  EveAPI
//
//  Created by Johnathan Richter on 9/21/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECharacter.h"

@implementation EVECharacter

-(EVECharacter *)init;
{
   self = [super init];
   if (self)
   {
      self.characterId = @0;
      self.characterName = @"";
      self.corporationId = @0;
      self.corporationName = @"";
      
      // Configure the blueprint representation of this class
      [self configureObjectBlueprint];
      
      return self;
   }
   else
   {
      return nil;
   }
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"characterID":@"characterId",
                                                       @"name":@"characterName",
                                                       @"corporationID":@"corporationId",
                                                       @"corporationName":@"corporationName"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Character ID: %@ | Name: %@ | "
                                     @"Corporation { ID: %@, Name: %@ }",
                                     self.characterId, self.characterName,
                                     self.corporationId, self.corporationName];
}

#pragma mark - KVC Attribute and To-One Compliance Methods

- (void) setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"characterId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"characterName"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"corporationId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"corporationName"])
   {
      [self setValue:@"" forKey:key];
   }
}

#pragma mark - KVC Indexed To-Many Compliance Methods

/**
 * No indexed To-Many relationships in this object.
 */

#pragma mark - KVC Unordered To-Many Compliance Methods

/**
 * No ordered To-Many relationships in this object.
 */

@end
