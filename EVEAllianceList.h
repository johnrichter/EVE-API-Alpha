//
//  EVEAllianceList.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"

@interface EVEAllianceList : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) NSMutableArray *alliances;

#pragma mark - Instance Properties

#pragma mark - Instance Methods
-(EVEAllianceList *)init;
-(void)queryTheApi;


@end
