//
//  ObjectBlueprint.m
//  EveAPI
//
//  Created by Johnathan Richter on 7/30/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "ObjectBlueprint.h"

@implementation ObjectBlueprint

- (ObjectBlueprint *)initWithClass:(Class)aClass
                           KeyPath:(NSString *)keyPath
                        Attributes:(NSDictionary *)attributes
                             Value:(NSString *)value
{
   self = [super init];
   if (self)
   {
      self.xmlKeypath = keyPath;
      self.objectClassId = aClass;
      self.objectAttributes = attributes;
      self.objectValue = value;
      self.objectRelationships = [[NSMutableArray alloc] init];
   }

   return self;
}

- (ObjectBlueprint *)initWithClass:(Class)aClass
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
      self.objectAttributes = attributes;
      self.objectValue = value;
      self.objectRelationships = [NSMutableArray arrayWithArray:relationships];
   }
   
   return self;
}

- (void)addRelationshipsFromArray:(NSArray *)relationships
{
   [self.objectRelationships addObjectsFromArray:relationships];
}

@end
