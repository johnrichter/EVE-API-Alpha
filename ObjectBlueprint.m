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
      self.xmlAttributes = [NSMutableDictionary new];
      self.objectAttributes = [[NSMutableDictionary alloc] init];
      self.objectRelationships = [[NSMutableArray alloc] init];
      self.objectValue = @"";
   }
   
   return self;
}

-(ObjectBlueprint *)initWithClass:(Class)aClass KeyPath:(NSString *)keyPath
{
   self = [super init];
   if (self)
   {
      self.objectClassId = aClass;
      self.xmlKeypath = keyPath;
      self.xmlAttributes = [NSMutableDictionary new];
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
      self.xmlAttributes = [NSMutableDictionary new];
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
      self.xmlAttributes = [NSMutableDictionary new];
      self.objectClassId = aClass;
      self.objectAttributes = [NSMutableDictionary dictionaryWithDictionary:attributes];
      self.objectRelationships = [[NSMutableArray alloc] init];
      self.objectValue = value;
   }

   return self;
}

-(ObjectBlueprint *)initWithClass:(Class)aClass
                          KeyPath:(NSString *)keyPath
               MatchingAttributes:(NSDictionary *)xmlAttributes
                       Attributes:(NSDictionary *)attributes
{
   self = [super init];
   if (self)
   {
      self.xmlKeypath = keyPath;
      self.xmlAttributes = [NSMutableDictionary dictionaryWithDictionary:xmlAttributes];
      self.objectClassId = aClass;
      self.objectAttributes = [NSMutableDictionary dictionaryWithDictionary:attributes];
      self.objectRelationships = [[NSMutableArray alloc] init];
      self.objectValue = @"";
   }
   
   return self;
}

-(ObjectBlueprint *)initWithClass:(Class)aClass
                          KeyPath:(NSString *)keyPath
               MatchingAttributes:(NSDictionary *)xmlAttributes
                       Attributes:(NSDictionary *)attributes
                            Value:(NSString *)value
{
   self = [super init];
   if (self)
   {
      self.xmlKeypath = keyPath;
      self.xmlAttributes = [NSMutableDictionary dictionaryWithDictionary:xmlAttributes];
      self.objectClassId = aClass;
      self.objectAttributes = [NSMutableDictionary dictionaryWithDictionary:attributes];
      self.objectRelationships = [[NSMutableArray alloc] init];
      self.objectValue = value;
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

-(void)addXmlAttribute:(NSString *)xmlAttribute
{
   _xmlAttributes[xmlAttribute] = [xmlAttribute copy];
}

-(void)addXmlAttributeFrom:(NSString *)from To:(NSString *)to
{
   _xmlAttributes[from] = to;
}

-(void)addXmlAttributeFromArray:(NSArray *)xmlAttributes
{
   for (NSString *attribute in xmlAttributes)
   {
      _xmlAttributes[attribute] = [attribute copy];
   }
}

-(void)addXmlattributesFromDictionary:(NSDictionary *)xmlAttributes
{
   for (NSString *attribute in xmlAttributes)
   {
      _xmlAttributes[attribute] = xmlAttributes[attribute];
   }
}

-(void)addRelationshipsFromArray:(NSArray *)relationships
{
   for (id relationship in relationships)
   {
      if (![_objectRelationships containsObject:relationship])
      {
         [_objectRelationships addObject:relationship];
      }
   }
}

@end
