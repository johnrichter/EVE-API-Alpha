//
//  EVECorporationRole.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/16/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECorporationRole.h"

@interface EVECorporationRole ()

@end

@implementation EVECorporationRole

#pragma mark - Instance Methods

-(EVECorporationRole *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.roleId = @0;
      self.roleName = @"";
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"roleID":@"roleId",
                                                       @"roleName":@"roleName"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Corporation Role Name: %@, ID: %@",
                                     self.roleName, self.roleId];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"roleId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"roleName"])
   {
      [self setValue:@"" forKey:key];
   }
}

@end
