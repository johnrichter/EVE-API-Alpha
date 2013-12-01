//
//  EVEFactionalWarfareTopStats.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"

@interface EVEFactionalWarfareTopStats : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties

#pragma mark - Instance Properties

#pragma mark - Instance Methods
-(EVEFactionalWarfareTopStats *)init;
-(void)queryTheApi;


@end
