//
//  RequestOperation.h
//  EveAPI
//
//  Created by Johnathan Richter on 7/30/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestOperationProtocol.h"

typedef enum RequestOperationError : NSUInteger
{
   kOperationSucess = 5000
} RequestOperationError;

@interface RequestOperation : NSOperation <NSConnectionDelegate>

#pragma mark - User Configured
@property (strong) NSString *urlToContact;
@property (strong) NSMutableArray *objectBlueprints;
@property (weak) id<RequestOperationProtocol> delegate;

#pragma mark - Class Configured
@property (strong) NSURLRequest *urlRequest;
@property (strong) NSURLConnection *urlConnection;
@property (strong) NSMutableData *receivedData;
@property (strong) NSDictionary *xmlMap;

#pragma mark - Initialization Routines
-(RequestOperation *)init;
-(RequestOperation *)initWithDelegate:(id<RequestOperationProtocol>)delegate;

-(void)setUrl:(NSString *)url WithArguments:(NSDictionary *)arguements Blueprints:(NSArray *)blueprints;

-(void)buildObjects;

@end
