//
//  EVEMarketOrders.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"

@interface EVEMarketOrders : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) NSMutableArray *orders;

#pragma mark - Instance Properties
@property (strong) NSString *keyId;
@property (strong) NSString *vCode;
@property (strong) NSNumber *characterId;
@property (strong) NSNumber *orderId;

#pragma mark - Instance Methods
-(EVEMarketOrders *)initWithEveKeyId:(NSString *)keyId
                               VCode:(NSString *)vCode
                         CharacterId:(NSNumber *)characterId
                             OrderId:(NSNumber *)orderId;
-(void)queryTheApi;

@end
