//
//  EVEMailBodies.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"
#import "EVEString.h"

@interface EVEMailBodies : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) NSMutableArray *eveMails;
@property (strong) EVEString *missingMessageIdsString;
@property (strong) NSArray *missingMessageIds;

#pragma mark - Instance Properties
@property (strong) NSString *keyId;
@property (strong) NSString *vCode;
@property (strong) NSNumber *characterId;
@property (strong) NSArray *mailIds;

#pragma mark - Instance Methods
-(EVEMailBodies *)initWithEveKeyId:(NSString *)keyId
                             VCode:(NSString *)vCode
                       CharacterId:(NSNumber *)characterId
                           MailIds:(NSArray *)mailIds;
-(void)queryTheApi;

@end
