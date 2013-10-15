//
//  EVEApiKeyInformation.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/2/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEApiObject.h"
#import "EVEApiKey.h"

@interface EVEApiKeyInformation : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) EVEApiKey *apiKey;

#pragma mark - Instance Properties
@property (strong) NSString *keyId;
@property (strong) NSString *vCode;

#pragma mark - Instance Methods
-(EVEApiKeyInformation *)initWithEveKeyId:(NSString *)keyId VCode:(NSString *)vCode;
-(void)queryTheApi;

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;


@end
