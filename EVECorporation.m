//
//  EVECorporation.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/29/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECorporation.h"

@interface EVECorporation ()

@end

@implementation EVECorporation

#pragma mark - Instance Methods

-(EVECorporation *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.corporationId = @0;
      self.allianceJoinDate = [EVEDate new];
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"corporationID":@"corporationId",
                                                       @"startDate":@"allianceJoinDate"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Corporation ID: %@ | Alliance Join Date: %@",
                                     self.corporationId, self.allianceJoinDate];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"corporationId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"allianceJoinDate"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
}

@end
