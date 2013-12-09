//
//  EVEFactionWarfarePilot.h
//  EveAPI
//
//  Created by Johnathan Richter on 12/8/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVEFactionWarfarePilot : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *pilotId;
@property (strong) NSString *pilotName;
@property (strong) NSNumber *kills;
@property (strong) NSNumber *victoryPoints;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

@end
