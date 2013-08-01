//
//  XMLDictionaryFactory.h
//  EveAPI
//
//  Created by Johnathan Richter on 7/31/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLDictionaryFactory : NSObject <NSXMLParserDelegate>

@property (strong) NSXMLParser *xmlParser;
@property (strong) NSMutableDictionary *xmlDictionary;

- (XMLDictionaryFactory *)init;

+ (NSDictionary *)dictionaryFromData:(NSData *)data Error:(NSError *)error;
+ (NSDictionary *)dictionaryFromFile:(NSURL *)pathToFile Error:(NSError *)error;

@end
