//
//  XMLDictionaryFactory.m
//  EveAPI
//
//  Created by Johnathan Richter on 7/31/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "XMLDictionaryFactory.h"

@implementation XMLDictionaryFactory

#pragma mark - Initialization Routines

- (XMLDictionaryFactory *)init
{
    self.xmlDictionary = [[NSMutableDictionary alloc] init];
    self.xmlParser = nil;
    return self;
}

#pragma mark - Class Factory Functions

+ (NSDictionary *)dictionaryFromData:(NSData *)data Error:(NSError *)error
{
    error = nil;
    
    XMLDictionaryFactory *xmlDictoryFactory = [[self alloc] init];
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    
    [parser setDelegate:xmlDictoryFactory];
    [parser setShouldProcessNamespaces:NO];
    [parser setShouldReportNamespacePrefixes:NO];
    [parser setShouldResolveExternalEntities:NO];
    
    BOOL parseSuccess = [parser parse];
    if (!parseSuccess)
    {
        error = [parser parserError];
    }
    
    return (NSDictionary *)[xmlDictoryFactory.xmlDictionary copy];
}

+ (NSDictionary *)dictionaryFromFile:(NSURL *)pathToFile Error:(NSError *)error
{
    error = nil;
    
    XMLDictionaryFactory *xmlDictoryFactory = [[self alloc] init];
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:pathToFile];
    
    [parser setDelegate:xmlDictoryFactory];
    [parser setShouldProcessNamespaces:NO];
    [parser setShouldReportNamespacePrefixes:NO];
    [parser setShouldResolveExternalEntities:NO];
    
    BOOL parseSuccess = [parser parse];
    if (!parseSuccess)
    {
        error = [parser parserError];
    }
    
    return (NSDictionary *)[xmlDictoryFactory.xmlDictionary copy];
}

#pragma mark - Handling XML

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"Started parsing data");
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"Ended parsing Data");
}

// Sent by a parser object to its delegate when it encounters an end tag for a specific element.
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"Started parsing element: %@ with namespace: %@, qualified name: %@, and attributes: %@",
          elementName, namespaceURI, qName, attributeDict);
}

// Sent by a parser object to its delegate when it encounters an end tag for a specific element.
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"Ended parsing of element: %@, with namespace: %@, and qualified name: %@",
          elementName, namespaceURI, qName);
}

// Sent by a parser object to its delegate when it encounters a fatal error.
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"Errors parsing data.\n  Code: %ld\n  Description: %@",
          (long)parseError.code, parseError.description);
}

// Sent by a parser object to provide its delegate with a string representing all or part of the characters of the current element.
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"Found characters: %@", string);
}

// Reported by a parser object to provide its delegate with a string representing all or part of the ignorable whitespace characters of the current element.
- (void)parser:(NSXMLParser *)parser foundIgnorableWhitespace:(NSString *)whitespaceString
{
    NSLog(@"Found ignorable whitespace: >%@<", whitespaceString);
}

// Sent by a parser object to its delegate when it encounters a comment in the XML.
- (void)parser:(NSXMLParser *)parser foundComment:(NSString *)comment
{
    NSLog(@"Found comment: %@", comment);
}

// Sent by a parser object to its delegate when it encounters a CDATA block.
- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock
{
    // Through this method the parser object passes the contents of the block to its delegate in an NSData object.
    // The CDATA block is character data that is ignored by the parser. The encoding of the character data is UTF-8.
    // To convert the data object to a string object, use the NSString method initWithData:encoding:.
    NSLog(@"Found CDATA block: %@", [[NSString alloc] initWithData:CDATABlock encoding:NSUTF8StringEncoding]);
}

#pragma mark - Handling the DTD

// Sent by a parser object to its delegate when it encounters a declaration of an attribute that is associated with a specific element.
- (void)parser:(NSXMLParser *)parser foundAttributeDeclarationWithName:(NSString *)attributeName forElement:(NSString *)elementName type:(NSString *)type defaultValue:(NSString *)defaultValue
{
    NSLog(@"Found attribute declaration with name: %@, for element: %@, with type: %@, and default value: %@",
          attributeName, elementName, type, defaultValue);
}

// Sent by a parser object to its delegate when it encounters a declaration of an element with a given model.
- (void)parser:(NSXMLParser *)parser foundElementDeclarationWithName:(NSString *)elementName model:(NSString *)model
{
    NSLog(@"Found element declaration with name: %@ and model: %@",
          elementName, model);
}

// Sent by a parser object to its delegate when it encounters an external entity declaration.
- (void)parser:(NSXMLParser *)parser foundExternalEntityDeclarationWithName:(NSString *)name publicID:(NSString *)publicID systemID:(NSString *)systemID
{
    NSLog(@"Found external entity declaration with name: %@, public ID: %@, and system ID: %@",
          name, publicID, systemID);
}

// Sent by a parser object to the delegate when it encounters an internal entity declaration.
- (void)parser:(NSXMLParser *)parser foundInternalEntityDeclarationWithName:(NSString *)name value:(NSString *)value
{
    NSLog(@"Found internal entity declaraion with name: %@ and value: %@",
          name, value);
}

// Sent by a parser object to its delegate when it encounters an unparsed entity declaration.
- (void)parser:(NSXMLParser *)parser foundUnparsedEntityDeclarationWithName:(NSString *)name publicID:(NSString *)publicID systemID:(NSString *)systemID notationName:(NSString *)notationName
{
    NSLog(@"Found unparsed entity declaration with name: %@, publid ID: %@, system ID: %@, and notation name: %@",
          name, publicID, systemID, notationName);
}

// Sent by a parser object to its delegate when it encounters a notation declaration.
- (void)parser:(NSXMLParser *)parser foundNotationDeclarationWithName:(NSString *)name publicID:(NSString *)publicID systemID:(NSString *)systemID
{
    NSLog(@"Found notation declaration with name: %@, public ID: %@, and system ID: %@",
          name, publicID, systemID);
}

@end
