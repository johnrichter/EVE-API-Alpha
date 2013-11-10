//
//  EVENotifications.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"

@interface EVENotifications : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) NSMutableArray *notifications;

#pragma mark - Instance Properties
@property (strong) NSString *keyId;
@property (strong) NSString *vCode;
@property (strong) NSNumber *characterId;

#pragma mark - Instance Methods
-(EVENotifications *)initWithEveKeyId:(NSString *)keyId
                                VCode:(NSString *)vCode
                          CharacterId:(NSNumber *)characterId;
-(void)queryTheApi;


@end
