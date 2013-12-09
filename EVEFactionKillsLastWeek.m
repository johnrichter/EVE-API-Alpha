//
//  EVEFactionKillsLastWeek.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEFactionKillsLastWeek.h"

@implementation EVEFactionKillsLastWeek

-(EVEFactionKillsLastWeek *)init
{
   self = [super init];
   if (self)
   {
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [super configureObjectBlueprint];
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint setObjectValue:@"kills"];
}

@end
