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

-(ObjectBuilder *)initWithXmlMap:(NSDictionary **)xmlMap AndBlueprints:(NSArray **)blueprints
{
   self = [super init];
   if (self)
   {
      self.xmlMap = *xmlMap;
      self.blueprints = *blueprints;
      self.keyPathToBlueprintMap = [[NSMutableDictionary alloc] init];
      
      return self;
   }
   else
   {
      return nil;
   }
}

-(NSArray *)buildObjects:(NSError **)error
{
   if (!self.xmlMap || !self.blueprints)
   {
      // TODO: set NSError
      return @[];
   }
   
   if (!error)
   {
      // TODO: set NSError
      return @[];
   }
   
   self.error = *error;
   
   // Build a key path to blueprint map for quick lookup
   [self createKeypathToBlueprintMap];
   
   
   
   // builtObjects - @[]
   // currentKeyPath = @""
   // Determine correct keyPath
   // currentBlueprint = Blueprint alloc init
   //
   // if blueprintPassedIn != nil
   //    currentBlueprint = blueprintPassedIn
   // else if currentKeyPath in self.keyPathToBlueprintMap
   //    currentBlueprint = self.keyPathToBlueprintMap[currentKeyPath]
   // else if passedInElement has children
   //    for each child of passedInElement
   //       [builtObjects addObjectsFromArray:<recurse>(childXmlMap, currentKeypath, nil)]
   //    if [builtObjects count] < 0
   //       return error (Unable to find blueprints in XML)
   // else
   //    return error (Unable to find blueprints in XML)
   //
   // create an instance of the currentBlueprint object
   // if the currentBlueprint [hasValue] && xml hasValue
   //    object value = xml value
   // for attribute in currentBlueprint attributes
   //    if passedInElement attributes hasKey:attribute && [object respondsToSelector:attributes[attribute]]
   //       object property = xml attribute
   //
   // For each child of passedInElement
   //    if blueprint hasRelationship    // We know at least one child is an object
   //       for relationshipKey in blueprint relationships
   //          if [child objectForKey:relationshipKey] != nil &&
   //             [object respondsToSelector:bp relationship property key (aka "a_b" -> "aB")]
   //
   //             Use our relationship's blueprint to build the child object in the childXMLMap
   //             object property = <repeat process>(childMap, currentKeypath, childBlueprint)[0]
   //             break;
   //
   //    else
   //       [builtObjects addObjectsFromArray:<recurse>(childMap, currentKeypath, nil)]
   //
   // [builtObjects addObject:object]
   //
   // return builtObjects
   
   return ;
}

-(void)createKeypathToBlueprintMap
{
   for (ObjectBlueprint *bp in self.blueprints)
   {
      if (self.keyPathToBlueprintMap[[bp xmlKeypath]])
      {
         // TODO: Error more than one blueprint per xml key path specified.
      }
      else
      {
         self.keyPathToBlueprintMap[[bp xmlKeypath]] = bp;
      }
   }
}

-(NSArray *)convertXmlElement:(NSDictionary *)element
            WithParentKeypath:(NSString *)parentKeypath
       ToObjectsWithBlueprint:(ObjectBlueprint *)blueprint
{
   
}

/*
-(BOOL)mapKeyPathsToBlueprints
{
   BOOL success = NO;
   return success;
}

-(NSArray *)buildObjectsOrig
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
*/
@end
