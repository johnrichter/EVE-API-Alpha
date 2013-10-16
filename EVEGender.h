//
//  EVEGender.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVEGender : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value
@property (strong) NSString *gender;

#pragma mark - XML Attributes

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

@end
