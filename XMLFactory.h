//
//  XMLDictionaryFactory.h
//  EveAPI
//
//  Created by Johnathan Richter on 7/31/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLFactory : NSObject <NSXMLParserDelegate>

// The container for the constructed xml document
@property (strong) NSMutableDictionary *xmlMap;

// Holds a mapping between element dict and parent element dict
// ->{elementID : parentID}
@property (strong) NSMutableDictionary *elementToParentMap;

// Pointer to the current element being processed. ->{'currentElement' : {...}}
@property (strong) NSMutableDictionary *currentElement;

- (XMLFactory *)init;

+ (NSMutableDictionary *)xmlFromData:(NSData *)data Error:(NSError *)error;
+ (NSMutableDictionary *)xmlFromFile:(NSURL *)pathToFile Error:(NSError *)error;

@end
