//
//  ResponseObjectArchitect.h
//  EveAPI
//
//  Created by Johnathan Richter on 7/30/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponseObjectArchitect : NSObject

@property (strong) NSArray *objectsToCreate;
@property (strong) NSDictionary *objectPropertyData;

@end
