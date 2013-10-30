//
//  EVEContractItem.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/29/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEContractItem.h"

@interface EVEContractItem ()

@end

@implementation EVEContractItem

#pragma mark - Instance Methods

-(EVEContractItem *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.recordId = @0;
      self.typeId = @0;
      self.quantity = @0;
      self.rawQuantity = @0;
      self.isNotPackaged = NO;
      self.isIncluded = NO;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"recordID":@"recordId",
                                                       @"typeID":@"typeId",
                                                       @"quantity":@"quantity",
                                                       @"rawQuantity":@"rawQuantity",
                                                       @"singleton":@"isNotPackaged",
                                                       @"included":@"isIncluded"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Contract Item Record ID: %@ | Type ID: %@ | "
                                     @"Quantity: %@ | Raw Quantity: %@ | "
                                     @"Is Not Packaged: %s | Is Included: %s",
                                     self.recordId, self.typeId, self.quantity,
                                     self.rawQuantity, self.isNotPackaged ? "Yes":"No",
                                     self.isIncluded ? "Yes":"No"];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"recordId"])
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
   else if([key isEqualToString:@"rawQuantity"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"isNotPackaged"])
   {
      [self setValue:NO forKey:key];
   }
   else if([key isEqualToString:@"isIncluded"])
   {
      [self setValue:NO forKey:key];
   }
}

@end
