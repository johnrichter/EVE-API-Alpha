//
//  ObjectBuilder.m
//  EveAPI
//
//  Created by Johnathan Richter on 9/22/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "ObjectBuilder.h"
#import "ObjectBlueprint.h"

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
   NSLog(@"keyPathToXmlMap: %@", self.keyPathToXmlMap);
   NSLog(@"objects: %@", self.objects);
   
   if (self.keyPathToXmlMap == nil) return nil;
   
   NSMutableArray *builtObjects = [[NSMutableArray alloc] init];
   
   // Loop over each blueprint
   for (ObjectBlueprint *blueprint in self.objects)
   {
      // Get the array corrosponding to the blueprints keypath.
      NSArray *blueprintXml = self.keyPathToXmlMap[[blueprint matchesKeyPath]];
      
      // For each entry in the array we have a unique object
      for (NSDictionary *entry in blueprintXml)
      {
         // Create the object
         id object = [[[blueprint objectClassId] alloc] init];
         
         // Get the attributes of the object from XML
         NSDictionary *attributes = entry[@"attributes"];
         
         // Loop over each attribute and copy it to the object if we are able to.
         for (NSString *xmlKey in attributes)
         {
            NSString *blueprintAttribute = [blueprint objectAttributes][xmlKey];
            if ([object respondsToSelector:NSSelectorFromString(blueprintAttribute)])
            {
               [object setValue:attributes[xmlKey] forKey:blueprintAttribute];
            }
            else
            {
               NSLog(@"Did not repond to selector %@", blueprintAttribute);
            }
         }
         
         [builtObjects addObject:object];
      }
   }
   
   return builtObjects;
}

@end
