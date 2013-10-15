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
@property (strong) NSMutableDictionary *xmlAttributes;
@property (strong) NSMutableDictionary *objectAttributes;
@property (strong) NSMutableArray *objectRelationships;
@property (strong) NSString *objectValue;

#pragma mark - Initialization Routines

-(ObjectBlueprint *)init;

-(ObjectBlueprint *)initWithClass:(Class)aClass
                          KeyPath:(NSString *)keyPath;

-(ObjectBlueprint *)initWithClass:(Class)aClass
                          KeyPath:(NSString *)keyPath
                       Attributes:(NSDictionary *)attributes;

-(ObjectBlueprint *)initWithClass:(Class)aClass
                          KeyPath:(NSString *)keyPath
                       Attributes:(NSDictionary *)attributes
                            Value:(NSString *)value;

-(ObjectBlueprint *)initWithClass:(Class)aClass
                          KeyPath:(NSString *)keyPath
               MatchingAttributes:(NSDictionary *)xmlAttributes
                       Attributes:(NSDictionary *)attributes;

-(ObjectBlueprint *)initWithClass:(Class)aClass
                          KeyPath:(NSString *)keyPath
               MatchingAttributes:(NSDictionary *)xmlAttributes
                       Attributes:(NSDictionary *)attributes
                            Value:(NSString *)value;

#pragma mark - Property Modification Routines

-(void)addAttribute:(NSString *)attribute;
-(void)addAttributeFrom:(NSString *)from To:(NSString *)to;
-(void)addAttributesFromArray:(NSArray *)attributes;
-(void)addAttributesFromDictionary:(NSDictionary *)attributes;

-(void)addXmlAttribute:(NSString *)xmlAttribute;
-(void)addXmlAttributeFrom:(NSString *)from To:(NSString *)to;
-(void)addXmlAttributeFromArray:(NSArray *)xmlAttributes;
-(void)addXmlattributesFromDictionary:(NSDictionary *)xmlAttributes;

-(void)addRelationshipsFromArray:(NSArray *)relationships;

@end
