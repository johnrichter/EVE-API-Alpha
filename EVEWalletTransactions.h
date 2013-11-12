//
//  EVEWalletTransactions.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"

@interface EVEWalletTransactions : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) NSMutableOrderedSet *transactions;

#pragma mark - Instance Properties
@property (strong) NSString *keyId;
@property (strong) NSString *vCode;
@property (strong) NSNumber *characterId;
@property (strong) NSNumber *walletId;
@property (strong) NSNumber *maxEntriesPerCall;
@property (strong) NSArray *entrySortDescriptors;

#pragma mark - Instance Methods
-(EVEWalletTransactions *)initWithEveKeyId:(NSString *)keyId
                                     VCode:(NSString *)vCode
                               CharacterId:(NSNumber *)characterId
                                  WalletId:(NSNumber *)walletId;
-(void)queryTheApi;


@end
