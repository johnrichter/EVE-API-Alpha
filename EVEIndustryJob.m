//
//  EVEIndustryJob.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/6/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEIndustryJob.h"

@interface EVEIndustryJob ()

@end

@implementation EVEIndustryJob

#pragma mark - Instance Methods

-(EVEIndustryJob *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.jobId = @0;
      self.assemblyLineId = @0;
      self.containerId = @0;
      self.installedItemId = @0;
      self.installedItemLocationId = @0;
      self.installedItemQuantity = @0;
      self.installedItemProductivityLevel = @0;
      self.installedItemMaterialLevel = @0;
      self.installedItemLicensedProductionRunsRemaining = @0;
      self.outputLocationId = @0;
      self.installerId = @0;
      self.runs = @0;
      self.licensedProductionRuns = @0;
      self.installedInSolarSystemId = @0;
      self.containerLocationId = @0;
      self.materialMultiplier = @0;
      self.charMaterialMultiplier = @0;
      self.timeMultiplier = @0;
      self.charTimeMultiplier = @0;
      self.installedItemTypeId = @0;
      self.outputTypeId = @0;
      self.containerTypeId = @0;
      self.installedItemCopy = NO;
      self.completed = NO;
      self.completedSuccessfully = NO;
      self.installedItemFlag = @0;
      self.outputFlag = @0;
      self.activityId = @0;
      self.completedStatus = @0;
      self.installTime = [EVEDate new];
      self.beginProductionTime = [EVEDate new];
      self.endProductionTime = [EVEDate new];
      self.pauseProductionTime = [EVEDate new];
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   NSDictionary *attributes = @{@"jobID":@"jobId",
                                @"assemblyLineID":@"assemblyLineId",
                                @"containerID":@"containerId",
                                @"installedItemID":@"installedItemId",
                                @"installedItemLocationID":@"installedItemLocationId",
                                @"installedItemQuantity":@"installedItemQuantity",
                                @"installedItemProductivityLevel":@"installedItemProductivityLevel",
                                @"installedItemMaterialLevel":@"installedItemMaterialLevel",
      @"installedItemLicensedProductionRunsRemaining":@"installedItemLicensedProductionRunsRemaining",
                                @"outputLocationID":@"outputLocationId",
                                @"installerID":@"installerId",
                                @"runs":@"runs",
                                @"licensedProductionRuns":@"licensedProductionRuns",
                                @"installedInSolarSystemID":@"installedInSolarSystemId",
                                @"containerLocationID":@"containerLocationId",
                                @"materialMultiplier":@"materialMultiplier",
                                @"charMaterialMultiplier":@"charMaterialMultiplier",
                                @"timeMultiplier":@"timeMultiplier",
                                @"charTimeMultiplier":@"charTimeMultiplier",
                                @"installedItemTypeID":@"installedItemTypeId",
                                @"outputTypeID":@"outputTypeId",
                                @"containerTypeID":@"containerTypeId",
                                @"installedItemCopy":@"installedItemCopy",
                                @"completed":@"completed",
                                @"completedSuccessfully":@"completedSuccessfully",
                                @"installedItemFlag":@"installedItemFlag",
                                @"outputFlag":@"outputFlag",
                                @"activityID":@"activityId",
                                @"completedStatus":@"completedStatus",
                                @"installTime":@"installTime",
                                @"beginProductionTime":@"beginProductionTime",
                                @"endProductionTime":@"endProductionTime",
                                @"pauseProductionTime":@"pauseProductionTime"};
   
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:attributes];
}

-(NSString *)description
{
   return [NSString stringWithFormat:
           @"Industry Job Activity ID: %@ | Assembly Line ID: %@ | "
           @"Started Production: %@ | Character ML Multiplier: %@ | Character Time Multiplier: %@ | "
           @"Completed: %s | Completed Status: %@ | Completed Successfully: %s | "
           @"Container ID: %@ | Container Location ID: %@ |  Container Type ID: %@ | "
           @"Production Finish Time: %@ |  Install Time: %@ |  "
           @"Installed In Solar System ID: %@ | Installed Item { Copy: %s, "
           @"Flag: %@, ID: %@, Licensed Production Runs Remaining: %@, Location ID: %@, "
           @"ML: %@, PL: %@, Quantity: %@, Type ID: %@ } | Installer ID: %@ | "
           @"Job ID: %@ | Licensed Production Runs: %@ | Material Multiplier: %@ | "
           @"Output { Flag: %@, Location ID: %@, Type ID: %@ } | "
           @"Pause Production Time: %@ | Runs: %@ | Time Multiplier: %@",
           self.activityId, self.assemblyLineId, self.beginProductionTime,
           self.charMaterialMultiplier, self.charTimeMultiplier, self.completed ? "Yes":"No",
           self.completedStatus, self.completedSuccessfully ? "Yes":"No", self.containerId,
           self.containerLocationId, self.containerTypeId, self.endProductionTime,
           self.installTime, self.installedInSolarSystemId, self.installedItemCopy ? "Yes":"No",
           self.installedItemFlag, self.installedItemId,
           self.installedItemLicensedProductionRunsRemaining,
           self.installedItemLocationId, self.installedItemMaterialLevel,
           self.installedItemProductivityLevel, self.installedItemQuantity,
           self.installedItemTypeId, self.installerId, self.jobId,
           self.licensedProductionRuns, self.materialMultiplier, self.outputFlag,
           self.outputLocationId, self.outputTypeId, self.pauseProductionTime,
           self.runs, self.timeMultiplier];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"jobId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"assemblyLineId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"containerId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"installedItemId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"installedItemLocationId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"installedItemQuantity"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"installedItemProductivityLevel"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"installedItemMaterialLevel"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"installedItemLicensedProductionRunsRemaining"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"outputLocationId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"installerId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"runs"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"licensedProductionRuns"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"installedInSolarSystemId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"containerLocationId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"materialMultiplier"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"charMaterialMultiplier"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"timeMultiplier"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"charTimeMultiplier"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"installedItemTypeId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"outputTypeId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"containerTypeId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"installedItemCopy"])
   {
      [self setValue:NO forKey:key];
   }
   else if([key isEqualToString:@"completed"])
   {
      [self setValue:NO forKey:key];
   }
   else if([key isEqualToString:@"completedSuccessfully"])
   {
      [self setValue:NO forKey:key];
   }
   else if([key isEqualToString:@"installedItemFlag"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"outputFlag"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"activityId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"completedStatus"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"installTime"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
   else if([key isEqualToString:@"beginProductionTime"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
   else if([key isEqualToString:@"endProductionTime"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
   else if([key isEqualToString:@"pauseProductionTime"])
   {
      [self setValue:[EVEDate new] forKey:key];
   }
}

@end
