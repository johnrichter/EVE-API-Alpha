//
//  ObjectBuilder.h
//  EveAPI
//
//  Created by Johnathan Richter on 9/22/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKValueTransformers.h"

@interface ObjectBuilder : NSObject

// Holds a reference to the callers xml map
@property (strong) NSMutableDictionary *xmlMap;

// Holds a reference to all blueprints from the caller
@property (strong) NSArray *blueprints;

@property (strong) NSMutableDictionary *keyPathToBlueprintMap;

//@property (strong) NSError *error;

@property (strong) RKCompoundValueTransformer *valueTransformer;

-(ObjectBuilder *)initWithXmlMap:(NSDictionary *)xmlMap AndBlueprints:(NSArray *)blueprints;

-(NSArray *)buildObjects:(NSError **)error;

@end
