//
//  EVEMail.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/8/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEDate.h"

@interface EVEMail : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *messageId;
@property (strong) NSNumber *senderId;
@property (strong) EVEDate *dateSent;
@property (strong) NSString *title;
@property (strong) NSString *toCorpOrAllianceIds;
@property (strong) NSString *toCharacterIds;
@property (strong) NSString *toListIds;
@property (strong) NSArray *sentToCorpAndAllianceIds;
@property (strong) NSArray *sentToCharacterIds;
@property (strong) NSArray *sentToMailingListIds;
@property (strong) NSString *mailBody;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods



@end
