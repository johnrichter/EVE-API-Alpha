//
//  EVEContact.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/21/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEContact.h"

@interface EVEContact ()

@end

@implementation EVEContact

#pragma mark - Instance Methods

-(EVEContact *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.contactId = @0;
      self.name = @"";
      self.standing = @0;
      self.typeId = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"contactID":@"contactId",
                                                       @"contactName":@"name",
                                                       @"contactTypeID":@"typeId",
                                                       @"standing":@"standing"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Contact ID: %@ | Name: %@ | Standing: %@ | Type ID: %@",
                                     self.contactId, self.name,
                                     self.standing, self.typeId];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"contactId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"name"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"typeId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"standing"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
