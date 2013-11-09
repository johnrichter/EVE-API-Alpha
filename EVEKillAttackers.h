//
//  EVEKillAttackeres.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/8/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVEKillAttackers : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes

#pragma mark - XML Relationships
@property (strong) NSArray *attackers;

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

-(void)setAttackerRelationKeypath:(NSString *)keypath;

@end
