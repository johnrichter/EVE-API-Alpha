//
//  XMLDictionary.h
//  EveAPI
//
//  Created by Johnathan Richter on 7/31/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLDictionary : NSMutableDictionary <NSXMLParserDelegate>

@property (strong) NSXMLParser *xmlParser;
@property (strong) NSMutableDictionary *xmlDictionary;

@end
