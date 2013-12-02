//
//  EVETypeName.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"

@interface EVETypeName : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) NSMutableArray *types;

#pragma mark - Instance Properties
@property (strong) NSArray *ids;
@property (strong) NSMutableArray *idsToQuery;
@property unsigned int maxEntriesPerCall;

#pragma mark - Instance Methods
-(EVETypeName *)initWithIds:(NSArray *)ids;
-(void)queryTheApi;


@end
