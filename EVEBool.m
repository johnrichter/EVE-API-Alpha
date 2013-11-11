//
//  EVEBool.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/10/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEBool.h"

@interface EVEBool ()

@end

@implementation EVEBool

#pragma mark - Instance Methods

-(EVEBool *)init
{
   self = [super init];
   if (self)
   {
      // Initialize Instance Variables
      self.boolValue = NO;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint setObjectValue:@"boolValue"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"EVEBool: %s", self.boolValue ? "Yes":"No"];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"boolValue"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
