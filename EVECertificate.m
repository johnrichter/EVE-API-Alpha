//
//  EVECertificate.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/16/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECertificate.h"

@interface EVECertificate ()

@end

@implementation EVECertificate

#pragma mark - Instance Methods

-(EVECertificate *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.certificateId = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributeFrom:@"certificateID" To:@"certificateId"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Certificate ID: %@", self.certificateId];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"certificateId"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
