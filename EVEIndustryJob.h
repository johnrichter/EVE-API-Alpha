//
//  EVEIndustryJob.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/6/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEDate.h"

@interface EVEIndustryJob : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes

// Unique ID for this job. Subject to the same renumbering as journal entries
@property (strong) NSNumber *jobId;

// ID of the assembly line this job is installed in. IDs for lines in stations don't
// change, but repackaged assembly arrays, repackaged mobile labs, and redeployed
// Rorquals will get new assemblyLineIDs
@property (strong) NSNumber *assemblyLineId;

// If installed in a station, this is the stationID in the staStations Table. If installed
// at a POS, this will be 0. See containerTypeID for POS module (i.e. Mobile Laboratory).
@property (strong) NSNumber *containerId;

// Blueprint itemID. See asset list
@property (strong) NSNumber *installedItemId;

// ID for the location from which the blueprint was installed. Office or POS module.
// See asset list.
@property (strong) NSNumber *installedItemLocationId;

// Number of blueprints entered (so always 1)
@property (strong) NSNumber *installedItemQuantity;

// Starting PL of blueprint.
@property (strong) NSNumber *installedItemProductivityLevel;

// Starting ML of blueprint.
@property (strong) NSNumber *installedItemMaterialLevel;

// Starting number of runs remaining. (-1 for a BPO)
@property (strong) NSNumber *installedItemLicensedProductionRunsRemaining;

// Destination hanger for product being created
@property (strong) NSNumber *outputLocationId;

// Character ID that started the job
@property (strong) NSNumber *installerId;

// Number of runs for this job (when making copies, number of BPCs to make).
@property (strong) NSNumber *runs;

// Number of runs on output BPCs for copying and inventing.
@property (strong) NSNumber *licensedProductionRuns;

// ID for the solar system this job was installed in. See mapSolarSystems table.
@property (strong) NSNumber *installedInSolarSystemId;

// Container of the container. Seems to generally be the solar system ID.
@property (strong) NSNumber *containerLocationId;

// Modifier for amount of materials required over standard BPO/C listing, as effected by
// installation location (i.e. Rapid Assembly Arrays have a modifier of 1.2, resulting
// in 20% extra material usage)
@property (strong) NSNumber *materialMultiplier;

// Effect character's skills & implants have on Materials required
@property (strong) NSNumber *charMaterialMultiplier;

// Effect of installation ie, an advanced mobile lab as a timeMultiplier of 0.65 when copying.
@property (strong) NSNumber *timeMultiplier;

// Speed of research/invention/production, as reduced by individual character skills.
@property (strong) NSNumber *charTimeMultiplier;

// TypeID of blueprint. See tables invTypes and invBlueprintTypes|invBlueprintTypes.
@property (strong) NSNumber *installedItemTypeId;

// TypeID of product. This refers to what's been built, what's being copied, or what's
// being invented. See invTypes table.
@property (strong) NSNumber *outputTypeId;

// TypeID of container, such as station, mobile lab, or assembly array. See invTypes table.
@property (strong) NSNumber *containerTypeId;

// 0 if the blueprint is an original, 1 if it is a copy.
@property BOOL installedItemCopy;

// 1 if the job has been delivered, 0 if not.
@property BOOL completed;

// Always 0?
@property BOOL completedSuccessfully;

// See APIv2 Inventory Flags?
@property (strong) NSNumber *installedItemFlag;

// See APIv2 Inventory Flags?
@property (strong) NSNumber *outputFlag;

// Activity ID of this job. See TL2MaterialsActivity.
@property (strong) NSNumber *activityId;

/**
 0 = failed
 1 = delivered
 2 = aborted
 3 = GM aborted
 4 = inflight unanchored
 5 = destroyed
 If it's not ready yet, completed = 0 and completedStatus is irrelevant/unitialized
 If complete = 1 and status = 0, then it [invention] failed
 */
@property (strong) NSNumber *completedStatus;

// When the job was installed.
@property (strong) EVEDate *installTime;

// When this job was started (aka after a wait or not)
@property (strong) EVEDate *beginProductionTime;

// When this job will finish or was finished. (Not when it was delivered)
@property (strong) EVEDate *endProductionTime;

// Normally "0001-01-01 00:00:00". If the job was installed into a POS module and that
// module went offline, this is when that module went offline. The S&I window in-game
// calculates the difference between this and endProductionTime to show time remaining
// (in red, and not counting down). When the module is back up, this is reset to
// "0001-01-01 00:00:00" and the endProductionTime is updated to reflect the delay.
@property (strong) EVEDate *pauseProductionTime;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

@end
