//
//  EVEMedal.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/10/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEDate.h"

@interface EVEMedal : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *medalId;
@property (strong) NSString *reason;
@property (strong) NSString *status;
@property (strong) NSNumber *issuerId;
@property (strong) EVEDate *dateIssued;
@property (strong) NSNumber *fromCorporationId;
@property (strong) NSString *title;
@property (strong) NSString *medalDescription;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

@end
