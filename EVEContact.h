//
//  EVEContact.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/21/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVEContact : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *contactId;
@property (strong) NSString *name;
@property (strong) NSNumber *standing;
@property (strong) NSNumber *typeId;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

@end
