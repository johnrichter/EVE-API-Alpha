//
//  EVEEventAttendee.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/14/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVEEventAttendee : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes

// ID of the character
@property (strong) NSNumber *characterId;

// Name of the character
@property (strong) NSString *characterName;

// The characters response.  Can be one of the following: "Undecided", "Accepted",
// "Declined", or "Tentative" - "Undecided" being the default
@property (strong) NSString *response;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

@end
