//
//  EVESkillQueueEntry.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/11/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEDate.h"

@interface EVESkillQueueEntry : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes

// The 0-based position in the queue.
@property (strong) NSNumber *queuePosition;

// The ID of the trained skill.
@property (strong) NSNumber *typeId;

// The level of this skill.
@property (strong) NSNumber *level;

// The number of skillpoints the character had for this skill when this training was
// started. Note there is bug with skills paused then resumed while the player is offline,
// the number of SP is the one at the beginning of the level, not the one when the skill
// was resumed.
@property (strong) NSNumber *startSp;

// The number of skillpoints the player will have when this skill is completed.
@property (strong) NSNumber *endSp;

// The time this training started, or null if the queue is currently paused.
@property (strong) EVEDate *startDate;

// The time this training should complete, or null if the queue is currently paused.
@property (strong) EVEDate *endDate;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

@end
