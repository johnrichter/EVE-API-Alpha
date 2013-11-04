//
//  EVEPlayersOnline.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEPlayersOnline.h"

@interface EVEPlayersOnline ()

@end

@implementation EVEPlayersOnline

#pragma mark - Instance Methods

-(EVEPlayersOnline *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.playerCount = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint setObjectValue:@"playerCount"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Number of players online: %@", self.playerCount];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"playerCount"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
