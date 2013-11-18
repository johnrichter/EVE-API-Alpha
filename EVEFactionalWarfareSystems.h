//
//  EVEFactionalWarfareSystems.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"

@interface EVEFactionalWarfareSystems : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) NSMutableArray *solarSystems;

#pragma mark - Instance Properties

#pragma mark - Instance Methods
-(EVEFactionalWarfareSystems *)init;
-(void)queryTheApi;


@end
