//
//  EVEIndustryJobs.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEApiObject.h"

@interface EVEIndustryJobs : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) NSMutableArray *jobs;

#pragma mark - Instance Properties
@property (strong) NSString *keyId;
@property (strong) NSString *vCode;
@property (strong) NSNumber *characterId;

#pragma mark - Instance Methods
-(EVEIndustryJobs *)initWithEveKeyId:(NSString *)keyId
                               VCode:(NSString *)vCode
                         CharacterId:(NSNumber *)characterId;
-(void)queryTheApi;

@end
