//
//  EVEMailingList.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/8/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEMailingList.h"

@interface EVEMailingList ()

@end

@implementation EVEMailingList

#pragma mark - Instance Methods

-(EVEMailingList *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.listId = @0;
      self.listName = @"";
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"listID":@"listId",
                                                       @"displayName":@"listName"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Mailing List ID: %@ | Name: %@",
                                     self.listId, self.listName];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"listId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"listName"])
   {
      [self setValue:@"" forKey:key];
   }
}

@end
