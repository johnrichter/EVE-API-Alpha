//
//  EVESkillGroup.h
//  EveAPI
//
//  Created by Johnathan Richter on 12/10/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVESkillGroup : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *groupId;
@property (strong) NSString *groupName;

#pragma mark - XML Relationships
@property (strong) NSArray *skills;

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;
-(void)setRelationKeypathsForSkills:(NSString *)skills
                        Description:(NSString *)description
                               Rank:(NSString *)rank
                     RequiredSkills:(NSString *)requiredSkills
                   PrimaryAttribute:(NSString *)primaryAttribute
                 SecondaryAttribute:(NSString *)secondaryAttribute
                       SkillBonuses:(NSString *)skillBonuses;

@end
