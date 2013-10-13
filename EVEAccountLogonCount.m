//
//  EVEAccountLogonCount.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/12/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEAccountLogonCount.h"

@implementation EVEAccountLogonCount

-(EVEAccountLogonCount *)init
{
   self = [super init];
   if (self)
   {
      self.count = @0;
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint setObjectValue:@"count"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@", self.count];
}

@end
