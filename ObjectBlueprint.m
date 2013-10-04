//
//  ObjectBlueprint.m
//  EveAPI
//
//  Created by Johnathan Richter on 7/30/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "ObjectBlueprint.h"

#pragma mark - Initialization Routines

@implementation ObjectBlueprint

-(ObjectBlueprint *)init
{
   self = [super init];
   if (self)
   {
      self.objectClassId = nil;
      self.xmlKeypath = @"";
      self.objectAttributes = [[NSMutableDictionary alloc] init];
      self.objectRelationships = [[NSMutableArray alloc] init];
      self.objectValue = @"";
   }
   
   return self;
}

-(ObjectBlueprint *)initWithClass:(Class)aClass
                           KeyPath:(NSString *)keyPath
                        Attributes:(NSDictionary *)attributes
{
   self = [super init];
   if (self)
   {
      self.xmlKeypath = keyPath;
      self.objectClassId = aClass;
      self.objectAttributes = [NSMutableDictionary dictionaryWithDictionary:attributes];
      self.objectRelationships = [[NSMutableArray alloc] init];
      self.objectValue = @"";
   }
   
   return self;
}

-(ObjectBlueprint *)initWithClass:(Class)aClass
                           KeyPath:(NSString *)keyPath
                        Attributes:(NSDictionary *)attributes
                             Value:(NSString *)value
{
   self = [super init];
   if (self)
   {
      self.xmlKeypath = keyPath;
      self.objectClassId = aClass;
      self.objectAttributes = [NSMutableDictionary dictionaryWithDictionary:attributes];
      self.objectRelationships = [[NSMutableArray alloc] init];
      
      if (!value)
      {
         self.objectValue = @"";
      }
      else
      {
         self.objectValue = value;
      }
   }

   return self;
}

-(ObjectBlueprint *)initWithClass:(Class)aClass
                           KeyPath:(NSString *)keyPath
                        Attributes:(NSDictionary *)attributes
                             Value:(NSString *)value
                     Relationships:(NSArray *)relationships;

{
   self = [super init];
   if (self)
   {
      self.xmlKeypath = keyPath;
      self.objectClassId = aClass;
      self.objectAttributes = [NSMutableDictionary dictionaryWithDictionary:attributes];
      self.objectRelationships = [NSMutableArray arrayWithArray:relationships];
      
      if (!value)
      {
         self.objectValue = @"";
      }
      else
      {
         self.objectValue = value;
      }
   }
   
   return self;
}

#pragma mark - Property Modification Routines

-(void)addAttribute:(NSString *)attribute
{
   _objectAttributes[attribute] = [attribute copy];
}

-(void)addAttributeFrom:(NSString *)from To:(NSString *)to
{
   _objectAttributes[from] = to;
}

-(void)addAttributesFromArray:(NSArray *)attributes
{
   for (NSString *attribute in attributes)
   {
      _objectAttributes[attribute] = [attribute copy];
   }
}

-(void)addAttributesFromDictionary:(NSDictionary *)attributes
{
   for (NSString *attribute in attributes)
   {
      _objectAttributes[attribute] = attributes[attribute];
   }
}

-(void)addRelationship:(BlueprintRelationship *)relationship
{
   if (![_objectRelationships containsObject:relationship])
   {
      [_objectRelationships addObject:relationship];
   }
}

-(void)addRelationshipsFromArray:(NSArray *)relationships
{
   for (BlueprintRelationship *relationship in relationships)
   {
      if (![_objectRelationships containsObject:relationship])
      {
         [_objectRelationships addObject:relationship];
      }
   }
}

@end
