//
//  EVEReferenceTypes.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"

@interface EVEReferenceTypes : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) NSMutableDictionary *refTypes;

#pragma mark - Instance Properties

#pragma mark - Instance Methods
-(EVEReferenceTypes *)init;
-(void)queryTheApi;


@end
