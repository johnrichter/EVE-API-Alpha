//
//  EVERace.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVERace.h"

@interface EVERace ()

@end

@implementation EVERace

#pragma mark - Instance Methods

-(EVERace *)init
{
   self = [super init];
   if (self)
   {
      // Initialize Instance Variables
      self.race = @"";
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint setObjectValue:@"race"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@", self.race];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"race"])
   {
      [self setValue:@"" forKey:key];
   }
}

@end
