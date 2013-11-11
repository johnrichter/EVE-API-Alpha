//
//  EVEResearchAgent.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/10/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEDate.h"

@interface EVEResearchAgent : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *agentId;

// The skill used for the research, not the typeID of the core received.
@property (strong) NSNumber *skillTypeId;

// The date the character began the current research with the agent at the current
// pointsPerDay. Each change in pointsPerDay will update researchStartDate as well.
@property (strong) EVEDate *dateResearchStarted;

// The number of points generated per day.
@property (strong) NSNumber *pointsGeneratedPerDay;

// The number of points remaining since last datacore purchase and/or pointsPerDay
// update. Mission RP is also added to this value. Notice that remainderPoints will be a
// negative number if datacores were purchased from an agent.
@property (strong) NSNumber *pointsRemaining;

/**
 * Notes
 * Formula for finding current RP you have is: 
 * currentPoints = remainderPoints + pointsPerDay * <Difference between now and startdate>
 */

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

@end
