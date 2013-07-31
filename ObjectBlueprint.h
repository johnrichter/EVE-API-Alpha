//
//  ObjectBlueprint.h
//  EveAPI
//
//  Created by Johnathan Richter on 7/30/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectBlueprint : NSObject

@property (strong) id objectClassId;
@property (strong) NSMutableDictionary *objectProperties;
@property (strong) NSString *keyPath;

@end
