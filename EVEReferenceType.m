//
//  EVEReferenceType.m
//  EveAPI
//
//  Created by Johnathan Richter on 12/8/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEReferenceType.h"

@interface EVEReferenceType ()

@end

@implementation EVEReferenceType

#pragma mark - Instance Methods

-(EVEReferenceType *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.refTypeId = @0;
      self.refTypeName = @"";
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"refTypeID":@"refTypeId",
                                                       @"refTypeName":@"refTypeName"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Reference Type: %@\t%@",
                                     self.refTypeId, self.refTypeName];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"refTypeId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"refTypeName"])
   {
      [self setValue:@"" forKey:key];
   }
}

@end
