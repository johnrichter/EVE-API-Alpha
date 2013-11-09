//
//  EVEAsset.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/13/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEAsset.h"
#import "BlueprintRelationship.h"

@interface EVEAsset ()

@end

@implementation EVEAsset

#pragma mark - Instance Methods

-(EVEAsset *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.itemId = @0;
      self.locationId = @0;
      self.typeId = @0;
      self.quantity = @1;
      self.flag = @0;
      self.isNotPackaged = NO;
      
      // XML Relationships
      self.containedAssets = @[];
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"itemID":@"itemId",
                                                       @"locationID":@"locationId",
                                                       @"typeID":@"typeId",
                                                       @"quantity":@"quantity",
                                                       @"flag":@"flag",
                                                       @"singleton":@"isNotPackaged"}];
}

-(void)setContainedAssetsRelationKeypath:(NSString *)keypath
{
   BlueprintRelationship *containedAssetsRelation =
      [BlueprintRelationship relationshipFromXmlKeypath:keypath
                           RelativeToObjectWithProperty:@"containedAssets"
                                           ForBlueprint:self.objectBlueprint];
   
   [self.objectBlueprint addRelationshipsFromArray:@[containedAssetsRelation]];
}

-(NSString *)description
{
   NSMutableString *asset = [NSMutableString stringWithFormat:@"Asset "];
   [asset appendFormat:@"Item ID: %@ | Type: %@ | Quantity: %@ | Location: %@ | "
                       @"Is Not Packaged: %s | Flag: %@\n",
                       self.itemId,
                       self.typeId,
                       self.quantity,
                       self.locationId,
                       self.isNotPackaged ? "Yes":"No",
                       self.flag];
   
   for (id object in self.containedAssets)
   {
      [asset appendFormat:@"\t%@", object];
   }
   
   return asset;
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"itemId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"locationId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"typeId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"quantity"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"flag"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"isNotPackaged"])
   {
      [self setValue:NO forKey:key];
   }
}

@end
