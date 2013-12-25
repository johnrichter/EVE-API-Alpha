//
//  EVESkillBounuses.h
//  EveAPI
//
//  Created by Johnathan Richter on 12/25/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVESkillBonuses : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes

#pragma mark - XML Relationships
@property (strong) NSArray *skillBonuses;

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;
-(void)setRelationKeypathsForBonuses:(NSString *)bonus;

@end
