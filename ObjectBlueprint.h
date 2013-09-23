//
//  ObjectBlueprint.h
//  EveAPI
//
//  Created by Johnathan Richter on 7/30/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectBlueprint : NSObject

@property (strong) Class objectClassId;
@property (strong) NSString *matchesKeyPath;
@property (strong) NSDictionary *objectAttributes;
@property BOOL objectHasValue;

- (ObjectBlueprint *)
   initWithClass:(id)class
   KeyPath:(NSString *)keyPath
   Attributes:(NSDictionary *)attributes
   HasValue:(BOOL)value;

@end
