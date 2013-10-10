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

-(ObjectBuilder *)initWithXmlMap:(NSDictionary *)xmlMap AndBlueprints:(NSArray *)blueprints
{
   self = [super init];
   if (self)
   {
      self.xmlMap = [NSMutableDictionary dictionaryWithDictionary:xmlMap];
      self.blueprints = blueprints;
      self.keyPathToBlueprintMap = [[NSMutableDictionary alloc] init];
      self.valueTransformer = [RKValueTransformer defaultValueTransformer];
      
      // Add a date formatter
      NSDateFormatter *dateFormatter = [NSDateFormatter new];
      dateFormatter.dateFormat = @"yyyy-mm-dd hh:mm:ss";
      [self.valueTransformer addValueTransformer:dateFormatter];
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
   
   //self.error = *error;
   
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
                          TopLevelNode:(NSMutableDictionary *)node
                     WithParentKeypath:(NSString *)parentKeypath
{
   // Create our built object collection.
   NSMutableArray *builtObjects = [[NSMutableArray alloc] init];
   
   // Manage our current key path based on the parent key path passed into the function.
   NSString *currentKeyPath = nil;
   
   // There will only be one element per node.
   NSString *currentElementName = [node allKeys][0];
   
   // Get a pointer to the current elements dictionary of attributes, children, and value
   NSMutableDictionary *currentElement = node[currentElementName];
   
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
      for (NSMutableDictionary *child in currentElement[@"children"])
      {
         [builtObjects addObjectsFromArray:[self createObjectsWithBlueprint:currentBlueprint
                                                               TopLevelNode:child
                                                          WithParentKeypath:currentKeyPath]];
         if ([builtObjects count] == 0)
         {
            // TODO: Set error (unable to find blueprints in XML) and return
         }
      }
      
      return builtObjects;
   }

   // No XML nodes match any blueprints given to the builder.
   else
   {
      // TODO: Set error (Unable to find blueprints in XML) and return
      return builtObjects; // for an unmatched element that does not have any children
                           // this will return an empty array for the function to
                           // recuse correctly.
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
   
   // Create lists of children that match this object's relationships and ones that don't
   NSMutableDictionary *childrenThatMatchRelationships = [[NSMutableDictionary alloc] init];
   NSMutableArray *childrenThatDontMatchRelationships = [[NSMutableArray alloc] init];
   
   // By creating these matches and storing the matches in collections, we build every
   // child that matches each blueprint relationship.
   [self createChildMatch:&childrenThatMatchRelationships
            AndNonMatches:&childrenThatDontMatchRelationships
            FromXmlParent:node
       UsingRelationships:currentBlueprint.objectRelationships];
   
   // Loop over children that match relationships first
   for (NSString *childXmlName in childrenThatMatchRelationships)
   {
      NSArray *children = childrenThatMatchRelationships[childXmlName];
      BlueprintRelationship *relationshipMatch = nil;
      
      // Find the matching relationship in our current blueprint
      for (BlueprintRelationship *bpRelationship in currentBlueprint.objectRelationships)
      {
         // If true, a match was found
         if ([bpRelationship.xmlKeypath isEqualToString:childXmlName])
         {
            relationshipMatch = bpRelationship;
            break;
         }
      }
      
      if (relationshipMatch == nil)
      {
         // TODO: report error (match didn't exist) <-- this shouldn't ever happen.
         return builtObjects;
      }
      
      // Create a container for all the children that are built.  If there are more than
      // one in the 'children' variable above then we will convert it to its destination
      // property as a collection.  If there is only one child to be built, we will assign
      // the property directly to that child.
      NSMutableArray *builtRelationshipChildren = [[NSMutableArray alloc] init];
      
      for (NSMutableDictionary *child in children)
      {
         // Build the child. Since the algorithm appends the current object on to the
         // returned array last we can assume that the last item in the returned array is
         // the one for this relationship.
         // TODO: Fix this, it is ugly and breakable.
         NSMutableArray *subnodeObjects = [NSMutableArray arrayWithArray:
                                           [self createObjectsWithBlueprint:relationshipMatch.blueprintToBuild
                                                               TopLevelNode:child
                                                          WithParentKeypath:currentKeyPath]];
         
         // The last object is the one we wanted to build.
         id builtChildObject = [subnodeObjects lastObject];
         
         // Remove it from the array
         [subnodeObjects removeObject:builtChildObject];
         
         // Add all other objects that were built to the final list
         [builtObjects addObjectsFromArray:subnodeObjects];
         
         // Add the built child to the builtRelationshipChildren array
         [builtRelationshipChildren addObject:builtChildObject];
      }
      
      // TODO: Handle 0 children case? (this should be guaranteed to never happen above)
      
      // If there is only one child that matched the relationship we have a To-One scenario.
      if ([builtRelationshipChildren count] == 1)
      {
         if ([blueprintObject respondsToSelector:NSSelectorFromString(relationshipMatch.objectKeypath)])
         {
            if ([blueprintObject class] == [builtRelationshipChildren[0] class])
            {
               // Assign the child to the property!
               [blueprintObject setValue:builtRelationshipChildren[0]
                                  forKey:relationshipMatch.objectKeypath];
            }
            else
            {
               // TODO: error (blueprintObject class did not match build child class in assignment)
            }
         }
         else
         {
            // TODO: error (blueprint To-One Relationship did not match object selector
         }
      }
      
      // If we have more than one this property is a To-Many relationship
      //    assign to the property using the conversion function
      else
      {
         BOOL conversionSuccess = [self setObject:blueprintObject
                                         Property:relationshipMatch.objectKeypath
                                            ToRhs:builtRelationshipChildren];
         if (!conversionSuccess)
         {
            // TODO: set error (unable to set relationship property: property)
         }
      }
   }
   
   // Now loop over children that do not match relationships
   for (NSMutableDictionary *xmlChild in childrenThatDontMatchRelationships)
   {
      [builtObjects addObjectsFromArray:[self createObjectsWithBlueprint:nil
                                                           TopLevelNode:xmlChild
                                                      WithParentKeypath:currentKeyPath]];
   }
   
   // Finally,  add the current object to the list of built objects
   [builtObjects addObject:blueprintObject];
   
   // Return the list to the caller
   return [NSArray arrayWithArray:builtObjects];
 }


-(BOOL)setObject:(id)object Property:(NSString *)property ToRhs:(id)rhs
{
   BOOL success = NO;
   
   if ([object respondsToSelector:NSSelectorFromString(property)])
   {
      // Create an output variable to hold the converted object
      id outputVar = nil;
      
      NSError *error = [[NSError alloc] init];
      
      // TODO: This is bad
      Class aClass = [[object valueForKey:property] class];
      while (aClass != nil)
      {
         success = [[self valueTransformer] transformValue:rhs
                                                   toValue:&outputVar
                                                   ofClass:aClass
                                                     error:&error];
         if (success)
         {
            break;
         }
         
         aClass = [aClass superclass];
      }
      
      if (!success)
      {
         // TODO: Set error (unable to convert to proper type)
         NSLog(@"Error in type transformation = %@", error);
      }
      else
      {
         [object setValue:outputVar forKey:property];
      }
   }
   else
   {
      // TODO: Set error (object does not respond that "property" selector)
   }
   
   return success;
}

-(void)createChildMatch:(NSMutableDictionary **)matches
          AndNonMatches:(NSMutableArray **)nonMatches
          FromXmlParent:(NSMutableDictionary *)parent
     UsingRelationships:(NSArray *)relationships
{
   // Loop over each relationship to find matching children
   for (BlueprintRelationship *relationship in relationships)
   {
      // If the xmlPath is a direct child of the parent this function will return all
      // matches.  If xmlPath is a distant decendant of any of the children, it will
      // return the dictionaries of each child and remove them from their decendant
      // parents so we do not process them again later on.
      NSMutableArray *results = [self findAndRemoveDecendantsFromXml:parent
                                                         ThatMatchKeyPath:[relationship.xmlKeypath
                                                                           componentsSeparatedByString:@"."]
                                                                NextIndex:0];
      
      [*matches setObject:results forKey:relationship.xmlKeypath];
   }
   
   // We only need to care about the non-matches direct children of this element.  Any
   // decendants of the non-matched children have been extracted and removed from
   // the main xml dictionary so they will not be processed again.
   // --> If it doesn't exist in the matches, put it in the matches.
   NSArray *allMatches = [*matches allValues];
   NSString *parentName = [parent allKeys][0];
   for (NSMutableDictionary *child in parent[parentName][@"children"])
   {
      if (![allMatches containsObject:child])
      {
         [*nonMatches addObject:child];
      }
   }
}

-(NSMutableArray *)findAndRemoveDecendantsFromXml:(NSMutableDictionary *)xml
                                      ThatMatchKeyPath:(NSArray *)keypath
                                             NextIndex:(NSUInteger)nextIndex
{
   NSMutableArray *results = [[NSMutableArray alloc] init];
   NSMutableArray *toRemove = [[NSMutableArray alloc] init];
   NSString *elementName = [xml allKeys][0];
   NSMutableDictionary *element = xml[elementName];
   
   NSUInteger lastObjectIndex = 0;
   if ([keypath count] > 1)
   {
      lastObjectIndex = [keypath count] - 1;
   }
   
   for (NSMutableDictionary *child in element[@"children"])
   {
      NSString *childName = [child allKeys][0];
      
      // If the element matches the final path in the keypath we have found our match!
      if ([childName isEqualToString:keypath[nextIndex]] &&
          nextIndex == lastObjectIndex)
      {
         [toRemove addObject:child];
         [results addObject:child];
      }
      
      // The elements matches our current index, but is not the last in line.  We need to
      // check this element's children
      else if ([childName isEqualToString:keypath[nextIndex]] &&
               nextIndex < lastObjectIndex)
      {
         NSMutableArray *searchResults = [self findAndRemoveDecendantsFromXml:child
                                                             ThatMatchKeyPath:keypath
                                                                    NextIndex:nextIndex + 1];
         
         [results addObjectsFromArray:searchResults];
      }
   }
   
   NSMutableArray *elementChildren = element[@"children"];
   for (NSMutableDictionary *child in toRemove)
   {
      [elementChildren removeObject:child];
   }
   
   return results;
}

@end
