//
//  EVEAttributeEnhancerName.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEAttributeEnhancerName.h"

@interface EVEAttributeEnhancerName ()

@end

@implementation EVEAttributeEnhancerName

#pragma mark - Instance Methods

-(EVEAttributeEnhancerName *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.name = @"";
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint setObjectValue:@"name"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@", self.name];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"name"])
   {
      [self setValue:@"" forKey:key];
   }
}

@end
