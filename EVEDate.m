//
//  EVEDate.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/4/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEDate.h"

@implementation EVEDate

-(EVEDate *)init
{
   self = [super init];
   if (self)
   {
      self.date = [[NSDate alloc] init];
      [self initializeDateFormats];
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)initializeDateFormats
{
   NSDateFormatter *format = [NSDateFormatter new];
   [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
   [format setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
   
   self.dateFormatters = @[format];
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint setObjectValue:@"date"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@", self.date];
}

@end
