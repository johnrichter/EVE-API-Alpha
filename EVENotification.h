//
//  EVENotification.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/28/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEDate.h"

@interface EVENotification : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *notificationId;
@property (strong) NSNumber *typeId;
@property (strong) NSNumber *senderId;
@property (strong) EVEDate *dateSent;
@property BOOL hasBeenRead;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

@end
