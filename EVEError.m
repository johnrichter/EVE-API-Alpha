//
//  EVEError.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/19/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEError.h"

@interface EVEError ()

@end

@implementation EVEError

#pragma mark - Instance Methods

-(EVEError *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.code = @0;
      self.details = @"";
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint setObjectValue:@"details"];
   [self.objectBlueprint addAttribute:@"code"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Code %@ | Details: %@",
                                     self.code, self.details];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"code"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"details"])
   {
      [self setValue:@"" forKey:key];
   }
}

@end
