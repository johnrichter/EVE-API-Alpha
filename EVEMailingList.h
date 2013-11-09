//
//  EVEMailingList.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/8/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVEMailingList : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *listId;
@property (strong) NSString *listName;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

@end
