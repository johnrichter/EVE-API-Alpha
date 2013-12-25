//
//  EVESkill.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/16/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEString.h"
#import "EVENumber.h"
#import "EVESkillRequirements.h"
#import "EVESkillBonuses.h"

@interface EVESkill : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *typeId;
@property (strong) NSString *typeName;
@property (strong) NSNumber *skillpoints;
@property (strong) NSNumber *level;
@property (strong) NSNumber *published;
@property (strong) NSNumber *skillGroupId;

#pragma mark - XML Relationships
@property (strong) EVEString *skillDescription;
@property (strong) EVENumber *rank;
@property (strong) EVESkillRequirements *requiredSkills;
@property (strong) EVEString *primaryAttribute;
@property (strong) EVEString *secondaryAttribute;
@property (strong) EVESkillBonuses *skillBonuses;

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

-(void)setRelationKeypathsForDescription:(NSString *)description
                                    Rank:(NSString *)rank
                          RequiredSkills:(NSString *)requiredSkills
                        PrimaryAttribute:(NSString *)primaryAttribute
                      SecondaryAttribute:(NSString *)secondaryAttribute
                            SkillBonuses:(NSString *)skillBonuses;

@end
