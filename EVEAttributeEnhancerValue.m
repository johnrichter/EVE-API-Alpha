//
//  EVEAttributeEnhancerId.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEAttributeEnhancerValue.h"

@interface EVEAttributeEnhancerValue ()

@end

@implementation EVEAttributeEnhancerValue

#pragma mark - Instance Methods

-(EVEAttributeEnhancerValue *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.enhancerValue = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint setObjectValue:@"enhancerValue"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@", self.enhancerValue];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"enhancerId"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
