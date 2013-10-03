//
//  EVECharacter.h
//  EveAPI
//
//  Created by Johnathan Richter on 9/21/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EVECharacter : NSObject

@property (strong) NSNumber *characterId;
@property (strong) NSString *characterName;
@property (strong) NSNumber *corporationId;
@property (strong) NSString *corporationName;
@property (strong) NSNumber *test;

-(EVECharacter *)init;

@end
