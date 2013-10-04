//
//  EVEApiKeyInformation.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/2/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEApi.h"
#import "EVEApiKey.h"

@interface EVEApiKeyInformation : EVEApi

#pragma mark - XML Properties
@property (strong) NSNumber *apiVersion;
@property (strong) NSDate *timeApiObtained;
@property (strong) EVEApiKey *apiKey;

-(BOOL)queryTheApi;

@end
