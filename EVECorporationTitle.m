//
//  EVECorporationTitle.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/16/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECorporationTitle.h"

@interface EVECorporationTitle ()

@end

@implementation EVECorporationTitle

#pragma mark - Instance Methods

-(EVECorporationTitle *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.titleId = @0;
      self.titleName = @"";
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"titleID":@"titleId",
                                                       @"titleName":@"titleName"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Corporation Title Name: %@, ID: %@",
                                     self.titleName, self.titleId];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"titleId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"titleName"])
   {
      [self setValue:@"" forKey:key];
   }
}

@end
