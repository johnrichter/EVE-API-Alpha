//
//  EVEContactNotifications.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEApiObject.h"

@interface EVEContactNotifications : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) NSMutableArray *notifications;

#pragma mark - Instance Properties
@property (strong) NSString *keyId;
@property (strong) NSString *vCode;
@property (strong) NSNumber *characterId;

#pragma mark - Instance Methods
-(EVEContactNotifications *)initWithEveKeyId:(NSString *)keyId
                                       VCode:(NSString *)vCode
                                 CharacterId:(NSNumber *)characterId;
-(void)queryTheApi;

@end
