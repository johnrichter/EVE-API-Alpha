//
//  EVELocations.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"

@interface EVELocations : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) NSMutableArray *itemLocations;

#pragma mark - Instance Properties
@property (strong) NSString *keyId;
@property (strong) NSString *vCode;
@property (strong) NSNumber *characterId;
@property (strong) NSArray *itemIds;

#pragma mark - Instance Methods
-(EVELocations *)initWithEveKeyId:(NSString *)keyId
                            VCode:(NSString *)vCode
                      CharacterId:(NSNumber *)characterId
                      ItemIds:(NSArray *)itemIds;
-(void)queryTheApi;
@end
