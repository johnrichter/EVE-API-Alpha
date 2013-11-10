//
//  EVENotificationTexts.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"

@interface EVENotificationTexts : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) NSMutableArray *notifications;
@property (strong) NSArray *missingNotificationIds;

#pragma mark - Instance Properties
@property (strong) NSString *keyId;
@property (strong) NSString *vCode;
@property (strong) NSNumber *characterId;
@property (strong) NSArray *notificationIds;

#pragma mark - Instance Methods
-(EVENotificationTexts *)initWithEveKeyId:(NSString *)keyId
                                    VCode:(NSString *)vCode
                              CharacterId:(NSNumber *)characterId
                          NotificationIds:(NSArray *)notificationIds;
-(void)queryTheApi;


@end
