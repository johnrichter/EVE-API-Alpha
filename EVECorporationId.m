//
//  EVECorporationId.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECorporationId.h"

@interface EVECorporationId ()

@end

@implementation EVECorporationId

#pragma mark - Instance Methods

-(EVECorporationId *)init
{
   self = [super init];
   if (self)
   {
      // Initialize Instance Variables
      self.corporationId = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint setObjectValue:@"corporationId"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@", self.corporationId];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"corporationId"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
