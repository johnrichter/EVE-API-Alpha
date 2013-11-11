//
//  EVESkillQueueEntry.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/11/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVESkillQueueEntry.h"

@interface EVESkillQueueEntry ()

@end

@implementation EVESkillQueueEntry

#pragma mark - Instance Methods

-(EVESkillQueueEntry *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.queuePosition = @0;
      self.typeId = @0;
      self.level = @0;
      self.startSp = @0;
      self.endSp = @0;
      self.startDate = [EVEDate new];
      self.endDate = [EVEDate new];
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"queuePosition":@"queuePosition",
                                                       @"typeID":@"typeId",
                                                       @"level":@"level",
                                                       @"startSP":@"startSp",
                                                       @"endSP":@"endSp",
                                                       @"startTime":@"startDate",
                                                       @"endTime":@"endDate"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Skill Queue Entry Position: %@ | Type ID: %@ | "
                                     @"Level: %@ | Start SP: %@ | End SP: %@ | "
                                     @"Start Date: %@ | End Date: %@",
                                     self.queuePosition, self.typeId, self.level,
                                     self.startSp, self.endSp, self.startDate,
                                     self.endDate];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"queuePosition"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"typeId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"level"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"startSp"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"endSp"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"startDate"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
   else if([key isEqualToString:@"endDate"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
}

@end
