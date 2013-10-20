//
//  EVECharacterMemory.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/16/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECharacterMemory.h"

@implementation EVECharacterMemory

-(NSString *)description
{
   return [NSString stringWithFormat:@"Character Memory: %@", self.number];
}

@end
