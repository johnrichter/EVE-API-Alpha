//
//  ObjectBlueprint.m
//  EveAPI
//
//  Created by Johnathan Richter on 7/30/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "ObjectBlueprint.h"

@implementation ObjectBlueprint

- (ObjectBlueprint *)
   initWithClass:(id)class
   KeyPath:(NSString *)keyPath
   Attributes:(NSDictionary *)attributes
   HasValue:(BOOL)value
{
   self = [super init];
   if (self)
   {
      self.objectClassId = class;
      self.matchesKeyPath = keyPath;
      self.objectAttributes = attributes;
      self.objectHasValue = value;
      
      return self;
   }
   else
   {
      return nil;
   }
}

@end
