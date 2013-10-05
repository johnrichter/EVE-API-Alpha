//
//  EVEApi.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/4/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApi.h"

@implementation EVEApi

-(EVEApi *)init
{
   self = [super init];
   if (self)
   {
      // XML Properties
      self.lastQueried = [[EVEDate alloc] init];
      self.cachedUntil = [[EVEDate alloc] init];
      self.apiVersion = @2;
      
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   // Configure the main blueprint for our api object
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributeFrom:@"version" To:@"apiVersion"];
}

@end
