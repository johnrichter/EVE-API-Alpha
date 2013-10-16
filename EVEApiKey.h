//
//  EVEKey.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/1/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEObject.h"
#import "EVEObjectProtocol.h"
#import "EVEDate.h"

@interface EVEApiKey : EVEObject <EVEObjectProtocol>

/**
 * Attributes
 */
@property (strong) NSNumber *accessMask;
@property (strong) EVEDate *expirationDate;
@property (strong) NSString *keyType;

/**
 * Relationships
 */
@property (strong) NSArray *characters;

-(EVEApiKey *)init;
-(void)configureObjectBlueprint;
-(void)setRelationshipsWithCharacterKeypath:(NSString *)charKeypath;

@end
