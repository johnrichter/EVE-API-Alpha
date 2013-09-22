//
//  ObjectBuilder.h
//  EveAPI
//
//  Created by Johnathan Richter on 9/22/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectBuilder : NSObject

@property (strong) NSDictionary *keyPathToXmlMap;
@property (strong) NSArray *objects;

-(ObjectBuilder *)initWithKeyPathToXmlMap:(NSDictionary *)map WithObjects:(NSArray *)objects;

-(NSArray *)buildObjects;

@end
