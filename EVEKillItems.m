//
//  EVEKillItems.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/8/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEKillItems.h"
#import "EVEKillItem.h"
#import "BlueprintRelationship.h"

@interface EVEKillItems ()

@end

@implementation EVEKillItems

#pragma mark - Instance Methods

-(EVEKillItems *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.items = @[];
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
}

-(void)setItemRelationKeypath:(NSString *)keypath
        ContainedItemsKeypath:(NSString *)containedKeypth
{
   EVEKillItem *item = [EVEKillItem new];
   [item setContainedItemsRelationKeypath:containedKeypth];
   
   BlueprintRelationship *itemRelation =
   [BlueprintRelationship relationshipFromXmlKeypath:keypath
                        RelativeToObjectWithProperty:@"items"
                                        ForBlueprint:[item objectBlueprint]];
   
   [self.objectBlueprint addRelationshipsFromArray:@[itemRelation]];
}

-(NSString *)description
{
   NSMutableString *items = [NSMutableString new];
   
   for (id object in self.items)
   {
      if ([object isEqual:[self.items lastObject]])
      {
         [items appendFormat:@"%@", object];
      }
      else
      {
         [items appendFormat:@"%@\n", object];
      }
   }
   
   return items;
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"items"])
   {
      [self setValue:@[] forKey:key];
   }
}

@end
