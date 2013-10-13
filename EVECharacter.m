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
                                                       @"characterName":@"characterName",
                                                       @"corporationID":@"corporationId",
                                                       @"corporationName":@"corporationName"}];
}

-(NSString *)description
{
   NSMutableString *output = [[NSMutableString alloc] init];
   [output appendFormat:@"\t----- EVECharacter -----\n"];
   [output appendFormat:@"\tID:\t\t\t\t%@\n", self.characterId];
   [output appendFormat:@"\tName:\t\t\t%@\n", self.characterName];
   [output appendFormat:@"\tCorporation ID:\t\t%@\n", self.corporationId];
   [output appendFormat:@"\tCorporation Name:\t%@\n", self.corporationName];
   
   return output;
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
