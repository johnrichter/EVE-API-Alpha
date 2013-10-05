//
//  EVECharacter.h
//  EveAPI
//
//  Created by Johnathan Richter on 9/21/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEObject.h"
#import "EVEObjectProtocol.h"

@interface EVECharacter : EVEObject <EVEObjectProtocol>

@property (strong) NSNumber *characterId;
@property (strong) NSString *characterName;
@property (strong) NSNumber *corporationId;
@property (strong) NSString *corporationName;
@property (strong) NSNumber *test;

-(EVECharacter *)init;
-(void)configureObjectBlueprint;

@end
