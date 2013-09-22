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

-(EVECharacter *)init;
-(NSNumber *)characterId;
-(void)setCharacterId:(NSNumber *)characterId;
-(NSString *)characterName;
-(void)setCharacterName:(NSString *)characterName;
-(NSNumber *)corporationId;
-(void)setCorporationId:(NSNumber *)corporationId;
-(NSString *)corporationName;
-(void)setCorporationName:(NSString *)corporationName;
-(void)setNilValueForKey:(NSString *)key;

@end
