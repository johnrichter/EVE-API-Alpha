//
//  ObjectBuilder.m
//  EveAPI
//
//  Created by Johnathan Richter on 9/22/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "ObjectBuilder.h"
#import "ObjectBlueprint.h"
#import "BlueprintRelationship.h"

@implementation ObjectBuilder

-(ObjectBuilder *)initWithXmlMap:(NSDictionary **)xmlMap AndBlueprints:(NSArray **)blueprints
{
   self = [super init];
   if (self)
   {
      self.xmlMap = *xmlMap;
      self.blueprints = *blueprints;
      self.keyPathToBlueprintMap = [[NSMutableDictionary alloc] init];
      self.valueTransformer = [RKValueTransformer defaultValueTransformer];
   }
   return self;
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
   
   // TODO: If no keypaths in map return error "No blueprints were given to this request"
   
   // Finally, convert our xml into real objects.  Error is set by this function
   return [self createObjectsWithBlueprint:nil
                              TopLevelNode:self.xmlMap
                         WithParentKeypath:@""];
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

-(NSArray *)createObjectsWithBlueprint:(ObjectBlueprint *)blueprintPrematch
                          TopLevelNode:(NSDictionary *)node
                     WithParentKeypath:(NSString *)parentKeypath
{
   // Create our built object collection.
   NSMutableArray *builtObjects = [[NSMutableArray alloc] init];
   
   // Manage our current key path based on the parent key path passed into the function.
   NSString *currentKeyPath = nil;
   
   // There will only be one element per node.
   NSString *currentElementName = [node allKeys][0];
   
   // Get a pointer to the current elements dictionary of attributes, children, and value
   NSDictionary *currentElement = node[currentElementName];
   
   if (!parentKeypath || [parentKeypath isEqualToString:@""])
   {
      currentKeyPath = currentElementName;
   }
   else
   {
      // Join the parent key path with the current element name with a '.' in between
      currentKeyPath = [@[parentKeypath, currentElementName] componentsJoinedByString:@"."];
   }
   
   // We use the blueprint parameter to determine if we need to build only a specific
   // object for the current node or to build any matching blueprint in self.blueprints
   ObjectBlueprint *currentBlueprint = nil;
   
   if (blueprintPrematch != nil)
   {
      currentBlueprint = blueprintPrematch;
   }
   
   // Other wise if we have a blueprint matching our current key path, use that blueprint
   // to build this object.
   else if (self.keyPathToBlueprintMap[currentKeyPath] != nil)
   {
      currentBlueprint = self.keyPathToBlueprintMap[currentKeyPath];
   }
   
   // Since we did not have a blueprint prematch and we did not have a blueprint in our
   // class blueprints collection match the current key path then we need to follow the
   // current elements children, if there are any.
   else if ([currentElement[@"children"] count] > 0)
   {
      for (NSDictionary *child in currentElement[@"children"])
      {
         [builtObjects addObjectsFromArray:[self createObjectsWithBlueprint:currentBlueprint
                                                               TopLevelNode:child
                                                          WithParentKeypath:currentKeyPath]];
         if ([builtObjects count] == 0)
         {
            // TODO: Set error (unable to find blueprints in XML) and return
         }
      }
   }

   // No XML nodes match any blueprints given to the builder.
   else
   {
      // TODO: Set error (Unable to find blueprints in XML) and return
   }

   // Create instance of object from our blueprint!
   id blueprintObject = [[[currentBlueprint objectClassId] alloc] init];
   
   // If the object does have a value property and one exists in the current element, set
   // the object's value.
   if ([[currentBlueprint objectValue] length] > 0  && currentElement[@"value"] != nil)
   {
      // Convert the xml value string to the proper blueprintObject property type
      // and set it.
      BOOL conversionSuccess = [self setObject:blueprintObject
                                      Property:[currentBlueprint objectValue]
                                         ToRhs:currentElement[@"value"]];
      if (!conversionSuccess)
      {
         // TODO: set error (unable to set property: property)
      }
   }
   
   // Set the object's attributes, one by one.
   for (NSString *attribute in [currentBlueprint objectAttributes])
   {
      if (currentElement[@"attributes"][attribute] != nil)
      {
         BOOL conversionSuccess = [self setObject:blueprintObject
                                         Property:[currentBlueprint objectAttributes][attribute]
                                            ToRhs:currentElement[@"attributes"][attribute]];
         if (!conversionSuccess)
         {
            // TODO: set error (unable to set property: property)
         }
      }
   }
   
   // We have set up the object with its values and attributes.  The next step is to
   // ensure that all relationships are set up properly.  To do this we need to build the
   // objects 'from the inside out'.  This means that we have to build all chilren
   // that corrospond to a relationship defined in the current objectBlueprint before
   // they can be assigned to this objects matching property.  If the child does not
   // corospond to a relationship then we need to process them as additional nodes in
   // case there are further blueprint matches deeper within the XML.
   
   // 1. build array with children that match a relationship
   // 2. build array with children that do not match a relationship
   // 3. Loop over relationship matching children
   // 4. Loop over non-relationship children
   
   for (NSDictionary *child in currentElement[@"children"])
   {
      // If we have any relationships, check the child against those first.
      if ([currentBlueprint.objectRelationships count] > 0)
      {
         BOOL childHandled = NO;
         
         for (BlueprintRelationship *relationship in currentBlueprint.objectRelationships)
         {
            // Check if this relationship corosponds to the child.  Note that keypath in
            // instance will only be the name of the element, not the '.' separated path.
            NSString *childName = [child allKeys][0];
            if ([childName isEqualToString:relationship.xmlKeypath] &&
                [blueprintObject respondsToSelector:NSSelectorFromString(relationship.objectKeypath)])
            {
               // Since the algorithm appends the current object on to the returned array
               // last we can assume that the last item in the returned array is the one
               // for this relationship.
               // TODO: Fix this, it is ugly and breakable.
               
               NSMutableArray *subnodeObjects = [NSMutableArray arrayWithArray:
                  [self createObjectsWithBlueprint:relationship.blueprintToBuild
                                      TopLevelNode:child
                                 WithParentKeypath:currentKeyPath]];
               
               // The last object is the one we wanted to build
               id builtChildObject = subnodeObjects[[subnodeObjects count] - 1];
               
               // If the blueprintObjects property is a collection type and it hasn't
               // been initialized then initialize it.
               Class propertyType = [[blueprintObject objectForKey:relationship.objectKeypath] class];
               
               // TODO: Does this comparison actually work?
               if (propertyType == [NSArray class] || propertyType == [NSMutableArray class])
               {
                  
               }
               else if (propertyType == [NSSet class] || propertyType == [NSMutableSet class])
               {
                  
               }
               else if (propertyType == [NSDictionary class] || propertyType == [NSMutableDictionary class])
               {
               
               }
               
               BOOL conversionSuccess = [self setObject:blueprintObject
                                               Property:relationship.objectKeypath
                                                  ToRhs:builtChildObject];
               if (!conversionSuccess)
               {
                  // TODO: set error (unable to set relationship property: property)
               }
               
               childHandled = YES;
               break;
            }
         }
         
         // This child does not corrospond to a relationship, build it.
         if (!childHandled)
         {
            [builtObjects addObjectsFromArray:[self createObjectsWithBlueprint:nil
                                                                  TopLevelNode:child
                                                             WithParentKeypath:currentKeyPath]];
         }
      }
      
      // No relationships for the current object, build the child
      else
      {
         [builtObjects addObjectsFromArray:[self createObjectsWithBlueprint:nil
                                                               TopLevelNode:child
                                                          WithParentKeypath:currentKeyPath]];
      }
   }
   
   [builtObjects addObject:blueprintObject];
   
   return [NSArray arrayWithArray:builtObjects];
   
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

}

-(BOOL)setObject:(id)object Property:(NSString *)property ToRhs:(id)rhs
{
   BOOL success = NO;
   
   if ([object respondsToSelector:NSSelectorFromString(property)])
   {
      // Get the class type of the destination variable
      Class propertyType = [[object valueForKey:property] class];
      
      // Create an instance of the property type
      id outputVar = [[propertyType alloc] init];
      
      NSError *error = self.error;
      
      success = [[self valueTransformer] transformValue:rhs
                                                toValue:&outputVar
                                                ofClass:propertyType
                                                  error:&error];
      if (!success)
      {
         // TODO: Set error (unable to convert to proper type)
         NSLog(@"Error in type transformation = %@", error);
      }
   }
   else
   {
      // TODO: Set error (object does not respond that "property" selector)
   }
   
   return success;
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
