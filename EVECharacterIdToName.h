//
//  EVECharacterName.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"

@interface EVECharacterIdToName : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) NSMutableArray *characters;

#pragma mark - Instance Properties
@property (strong) NSArray *ids;
@property unsigned int maxIdsPerCall;
@property unsigned int numIdsLeftToQuery;
@property unsigned int idsQueryIndex;

#pragma mark - Instance Methods
-(EVECharacterIdToName *)initWithIds:(NSArray *)ids;
-(void)queryTheApi;


@end
