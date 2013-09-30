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
@property (strong) NSString *xmlKeypath;
@property (strong) NSDictionary *objectAttributes;
@property (strong) NSMutableArray *objectRelationships;
@property (strong) NSString *objectValue;

- (ObjectBlueprint *)initWithClass:(Class)aClass
                           KeyPath:(NSString *)keyPath
                        Attributes:(NSDictionary *)attributes
                             Value:(NSString *)value;

- (ObjectBlueprint *)initWithClass:(Class)aClass
                           KeyPath:(NSString *)keyPath
                        Attributes:(NSDictionary *)attributes
                             Value:(NSString *)value
                     Relationships:(NSArray *)relationships;

- (void)addRelationshipsFromArray:(NSArray *)relationships;

@end
