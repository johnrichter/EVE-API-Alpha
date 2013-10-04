//
//  EVEKey.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/1/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EVEApiKey : NSObject

/**
 * Attributes
 */
@property (strong) NSNumber *accessMask;
@property (strong) NSDate *expirationDate;
@property (strong) NSString *keyType;

/**
 * Relationships
 */
@property (strong) NSArray *characters;

-(EVEApiKey *)init;

//-(NSUInteger)type;
//-(void)setType:(NSString *)type;

@end
