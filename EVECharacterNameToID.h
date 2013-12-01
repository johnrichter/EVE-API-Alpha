//
//  EVECharacterNameToId.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"

@interface EVECharacterNameToId : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) NSMutableArray *characters;

#pragma mark - Instance Properties
@property (strong) NSArray *names;
@property unsigned int maxNamesPerCall;
@property unsigned int numNamesLeftToQuery;
@property unsigned int namesQueryIndex;

#pragma mark - Instance Methods
-(EVECharacterNameToId *)initWithNames:(NSArray *)names;
-(void)queryTheApi;


@end