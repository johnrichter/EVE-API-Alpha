//
//  EVEKey.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/1/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiKey.h"
#import "BlueprintRelationship.h"

@implementation EVEApiKey

-(EVEApiKey *)init;
{
   self = [super init];
   if (self)
   {
      self.accessMask = @0;
      self.keyType = @"";
      self.expirationDate = [EVEDate new];
      self.characters = @[];
   
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"accessMask":@"accessMask",
                                                       @"type":@"keyType",
                                                       @"expires":@"expirationDate"}];
}

-(NSString *)description
{
   NSMutableString *output = [[NSMutableString alloc] init];
   [output appendFormat:@"\t----- EVE API Key -----\n"];
   [output appendFormat:@"\tKey Type:\t\t\t%@\n", _keyType];
   [output appendFormat:@"\tAccess Mask:\t\t%@\n", _accessMask];
   [output appendFormat:@"\tExpiration Date:\t%@\n\n", _expirationDate];
   for (id character in _characters)
   {
      [output appendFormat:@"%@\n", character];
   }
   
   return output;
}

#pragma mark - KVC Attribute and To-One Compliance Methods

- (void) setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"accessMask"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"expirationDate"])
   {
      [self setValue:[[NSDate alloc] init] forKey:key];
   }
   else if([key isEqualToString:@"keyType"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"characters"])
   {
      [self setValue:@[] forKey:key];
   }
}

#pragma mark - KVC Indexed To-Many Compliance Methods

/**
 * No indexed To-Many relationships in this object.
 */

#pragma mark - KVC Unordered To-Many Compliance Methods

/**
 * No ordered To-Many relationships in this object.
 */

@end
