//
//  EVECallList.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEApiObject.h"

@interface EVECallList : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) NSMutableArray *callGroups;
@property (strong) NSMutableArray *calls;

#pragma mark - Instance Properties

#pragma mark - Instance Methods
-(EVECallList *)init;
-(void)queryTheApi;

@end
