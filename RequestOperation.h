//
//  RequestOperation.h
//  EveAPI
//
//  Created by Johnathan Richter on 7/30/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestOperation : NSOperation <NSConnectionDelegate>

@property (strong) NSURLRequest *urlRequest;
@property (strong) NSURLConnection *urlConnection;
@property (strong) NSMutableData *receivedData;
@property (strong) NSDictionary *xmlMap;
@property (strong) NSMutableDictionary *blueprintToDictionaryMap;

@property (strong) NSArray *objectBlueprints;

-(RequestOperation *)initWithUrl:(NSURL *)url Blueprints:(NSArray *)blueprints;

@end
