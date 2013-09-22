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
      
      return self;
   }
   else
   {
      return nil;
   }
}

#pragma mark - KVC Attribute and To-One Compliance Methods

/**
 * The following accessor methods are automatically generated, however they are 
 * implemented in case greater control over set/get is needed.
 */
-(NSNumber *)characterId
{
   return self.characterId;
}

-(void)setCharacterId:(NSNumber *)characterId
{
   self.characterId = characterId;
}

-(NSString *)characterName
{
   return self.characterName;
}

-(void)setCharacterName:(NSString *)characterName
{
   self.characterName = characterName;
}

-(NSNumber *)corporationId
{
   return self.corporationId;
}

-(void)setCorporationId:(NSNumber *)corporationId
{
   self.corporationId = corporationId;
}

-(NSString *)corporationName
{
   return self.corporationName;
}

-(void)setCorporationName:(NSString *)corporationName
{
   self.corporationName = corporationName;
}

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
