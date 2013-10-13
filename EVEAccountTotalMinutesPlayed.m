//
//  EVEAccountTotalMinutesPlayed.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/12/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEAccountTotalMinutesPlayed.h"

@implementation EVEAccountTotalMinutesPlayed

-(EVEAccountTotalMinutesPlayed *)init
{
   self = [super init];
   if (self)
   {
      self.totalMinutes = @0;
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint setObjectValue:@"totalMinutes"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@", self.totalMinutes];
}

@end
