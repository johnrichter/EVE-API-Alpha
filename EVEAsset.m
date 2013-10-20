//
//  EVEAsset.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/13/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEAsset.h"

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
      self.quantity = @0;
      self.flag = @0;
      self.isPackaged = @0;
      
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
                                                       @"singleton":@"isPackaged"}];
}

-(NSString *)description
{
   NSMutableString *asset = [NSMutableString stringWithFormat:@"Asset "];
   [asset appendFormat:@"Type: %@ | Quantity: %@ | Location: %@ | Is Packaged: %s | Flag: %@\n",
                       self.typeId,
                       self.quantity,
                       self.locationId,
                       self.isPackaged ? "Yes":"No",
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
   else if([key isEqualToString:@"isPackaged"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
