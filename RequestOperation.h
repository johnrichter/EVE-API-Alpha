//
//  RequestOperation.h
//  EveAPI
//
//  Created by Johnathan Richter on 7/30/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPURLConnection.h"

@interface RequestOperation : NSOperation

@property (strong) HTTPURLConnection *httpConnection;
@property (strong) NSMutableArray *objectBlueprints;

@end
