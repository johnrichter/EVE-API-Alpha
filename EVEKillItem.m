//
//  EVEKillItem.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/8/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEKillItem.h"
#import "BlueprintRelationship.h"

@interface EVEKillItem ()

@end

@implementation EVEKillItem

#pragma mark - Instance Methods

-(EVEKillItem *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.typeId = @0;
      self.flag = @0;
      self.quantityDropped = @0;
      self.quantityDestroyed = @0;
      self.singleton = @0;
      self.containedItems = @[];
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"typeID":@"typeId",
                                                       @"flag":@"flag",
                                                       @"qtyDropped":@"quantityDropped",
                                                       @"qtyDestroyed":@"quantityDestroyed",
                                                       @"singleton":@"singleton"}];
}

-(void)setContainedItemsRelationKeypath:(NSString *)keypath
{
   BlueprintRelationship *containedItemsRelation =
      [BlueprintRelationship relationshipFromXmlKeypath:keypath
                           RelativeToObjectWithProperty:@"containedItems"
                                           ForBlueprint:self.objectBlueprint];
   
   [self.objectBlueprint addRelationshipsFromArray:@[containedItemsRelation]];
}

-(NSString *)description
{
   NSMutableString *item = [NSMutableString stringWithFormat:
                            @"Item Type: %@ | Flag: %@ | Quantity Dropped: %@ | "
                            @"Quantity Destroyed: %@ | Singleton: %@",
                            self.typeId, self.flag, self.quantityDropped,
                            self.quantityDestroyed, self.singleton];
   
   for (id object in self.containedItems)
   {
      if ([object isEqual:[self.containedItems lastObject]])
      {
         [item appendFormat:@"\t%@", object];
      }
      else
      {
         [item appendFormat:@"\t%@\n", object];
      }
   }
   
   return item;
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"typeId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"flag"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"quantityDropped"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"quantityDestroyed"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"singleton"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"containedItems"])
   {
      [self setValue:@[] forKey:key];
   }
}

@end
