//
//  EVECloneSkillPoints.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVECloneSkillPoints : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value
@property (strong) NSNumber *skillPoints;

#pragma mark - XML Attributes

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

@end
