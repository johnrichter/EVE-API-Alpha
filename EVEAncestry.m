//
//  EVEAncestry.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEAncestry.h"

@interface EVEAncestry ()

@end

@implementation EVEAncestry

#pragma mark - Instance Methods

-(EVEAncestry *)init
{
   self = [super init];
   if (self)
   {
      // Initialize Instance Variables
      self.ancestry = @"";
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint setObjectValue:@"ancestry"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@", self.ancestry];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"ancestry"])
   {
      [self setValue:@"" forKey:key];
   }
}

@end
