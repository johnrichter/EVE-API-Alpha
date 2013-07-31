//
//  ResponseObjectFilterOperation.h
//  EveAPI
//
//  Created by Johnathan Richter on 7/30/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponseObjectFilterOperation : NSOperation

@property (strong) NSData *responseData;
@property (strong) NSMutableArray *objectMatches;
@property (strong) NSArray *objectBlueprints;

@end
