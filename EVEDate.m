//
//  EVEDate.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/4/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEDate.h"

@implementation EVEDate

-(EVEDate *)init
{
   self = [super init];
   if (self)
   {
      self.date = [[NSDate alloc] init];
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint setObjectValue:@"date"];
}

@end
