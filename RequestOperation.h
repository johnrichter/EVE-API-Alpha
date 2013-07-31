//
//  RequestOperation.h
//  EveAPI
//
//  Created by Johnathan Richter on 7/30/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPURLConnection.h"
#import "ResponseObjectFilter.h"

@interface RequestOperation : NSOperation

@property (strong) HTTPURLConnection *httpConnection;
@property (strong) NSMutableArray *objectBlueprints;
@property (strong) ResponseObjectFilter *responseFilter;

@end
