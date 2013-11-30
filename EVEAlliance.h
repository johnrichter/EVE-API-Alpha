//
//  EVEAlliance.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/29/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEDate.h"

@interface EVEAlliance : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSString *name;
@property (strong) NSString *shortName;
@property (strong) NSNumber *allianceId;
@property (strong) NSNumber *executorCorpId;
@property (strong) NSNumber *memberCount;
@property (strong) EVEDate *creationDate;

#pragma mark - XML Relationships
@property (strong) NSArray *memberCorporations;

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;
-(void)setMemberCorporationRelationKeypath:(NSString *)memberCorpKeypath;

@end
