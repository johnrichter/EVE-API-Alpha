//
//  EVESolarSystemJumps.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/17/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVESolarSystemJumps : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *solarSystemId;
@property (strong) NSNumber *shipJumps;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

@end
