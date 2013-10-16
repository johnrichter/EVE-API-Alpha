//
//  EVEGender.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEGender.h"

@interface EVEGender ()

@end

@implementation EVEGender

#pragma mark - Instance Methods

-(EVEGender *)init
{
   self = [super init];
   if (self)
   {
      // Initialize Instance Variables
      self.gender = @"";
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint setObjectValue:@"gender"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@", self.gender];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"gender"])
   {
      [self setValue:@"" forKey:key];
   }
}

@end
