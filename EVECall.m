//
//  EVECall.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECall.h"

@interface EVECall ()

@end

@implementation EVECall

#pragma mark - Instance Methods

-(EVECall *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.accessMask = @0;
      self.type = @"";
      self.name = @"";
      self.groupId = @0;
      self.callDescription = @"";
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"accessMask":@"accessMask",
                                                       @"type":@"type",
                                                       @"name":@"name",
                                                       @"groupID":@"groupId",
                                                       @"description":@"callDescription"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Call Type: %@ | Name: %@ | Group ID: %@ | "
                                     @"Access Mask: %@ | Description: %@",
                                     self.type, self.name, self.groupId, self.accessMask,
                                     self.callDescription];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"accessMask"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"type"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"name"])
   {
      [self setValue:@"" forKey:key];
   }
   else  if([key isEqualToString:@"groupId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"callDescription"])
   {
      [self setValue:@"" forKey:key];
   }
}

@end
