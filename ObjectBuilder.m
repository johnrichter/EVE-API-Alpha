//
//  ObjectBuilder.m
//  EveAPI
//
//  Created by Johnathan Richter on 9/22/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "ObjectBuilder.h"

@implementation ObjectBuilder

-(ObjectBuilder *)initWithKeyPathToXmlMap:(NSDictionary *)map WithObjects:(NSArray *)objects
{
   self = [super init];
   if (self)
   {
      self.keyPathToXmlMap = map;
      self.objects = objects;
      
      return self;
   }
   else
   {
      return nil;
   }
}

-(NSArray *)buildObjects
{
   if (self.keyPathToXmlMap == nil) return nil;
   
   NSArray *builtObjects = @[];
   
   
   
   return builtObjects;
}

@end
