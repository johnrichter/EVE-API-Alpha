//
//  EVECharacterId.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECharacterId.h"

@interface EVECharacterId ()

@end

@implementation EVECharacterId

#pragma mark - Instance Methods

-(EVECharacterId *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.characterId = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint setObjectValue:@"characterId"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@", self.characterId];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"characterId"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
