//
//  EVEContactNotification.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/28/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVENotification.h"

@interface EVEContactNotification : EVENotification

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSString *senderName;
@property (strong) NSString *messageData;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

@end
