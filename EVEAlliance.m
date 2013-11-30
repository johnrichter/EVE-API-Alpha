//
//  EVEAlliance.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/29/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEAlliance.h"
#import "EVECorporation.h"
#import "BlueprintRelationship.h"

@interface EVEAlliance ()

@end

@implementation EVEAlliance;

#pragma mark - Instance Methods

-(EVEAlliance *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.name = @"";
      self.shortName = @"";
      self.allianceId = @0;
      self.executorCorpId = @0;
      self.memberCount = @0;
      self.creationDate = [EVEDate new];
      self.memberCorporations = @[];
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"name":@"name",
                                                       @"shortName":@"shortName",
                                                       @"allianceID":@"allianceId",
                                                       @"executorCorpID":@"executorCorpId",
                                                       @"memberCount":@"memberCount",
                                                       @"startDate":@"creationDate"}];
}

-(void)setMemberCorporationRelationKeypath:(NSString *)memberCorpsKeypath
{
   BlueprintRelationship *corpRelation =
   [BlueprintRelationship relationshipFromXmlKeypath:memberCorpsKeypath
                        RelativeToObjectWithProperty:@"memberCorporations"
                                        ForBlueprint:[[EVECorporation new] objectBlueprint]];
   
   [self.objectBlueprint addRelationshipsFromArray:@[corpRelation]];
}

-(NSString *)description
{
   NSMutableString *alliance = [NSMutableString stringWithFormat:
                                @"Alliance: %@ [%@] | ID: %@ | Executor ID: %@ | "
                                @"Member Count: %@ | Creation Date: %@",
                                self.name, self.shortName, self.allianceId,
                                self.executorCorpId, self.memberCount,
                                self.creationDate];
   
   for (id object in self.memberCorporations)
   {
      [alliance appendFormat:@"\t%@\n", object];
   }
   
   return alliance;
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"name"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"shortName"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"allianceId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"executorCorpId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"memberCount"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"creationDate"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
   else if([key isEqualToString:@"memberCorporations"])
   {
      [self setValue:@[] forKey:key];
   }
}

@end
