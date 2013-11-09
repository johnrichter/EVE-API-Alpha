//
//  EVEItemLocation.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/8/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEItemLocation.h"

@interface EVEItemLocation ()

@end

@implementation EVEItemLocation

#pragma mark - Instance Methods

-(EVEItemLocation *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.itemId = @0;
      self.itemName = @"";
      self.x = @0;
      self.y = @0;
      self.z = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"itemID":@"itemId",
                                                       @"itemName":@"itemName",
                                                       @"x":@"x",
                                                       @"y":@"y",
                                                       @"z":@"z"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Item Location Item { ID: %@, Name: %@ } | "
                                     @"X: %@ | Y: %@ | Z: %@",
                                     self.itemId, self.itemName, self.x, self.y, self.z];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"itemId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"itemName"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"x"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"y"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"z"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
