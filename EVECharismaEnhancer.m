//
//  EVECharismaEnhancer.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECharismaEnhancer.h"

@implementation EVECharismaEnhancer

#pragma mark - Instance Methods

-(NSString *)description
{
   return [NSString stringWithFormat:@"Charisma Enhancer Id: %@ | Name: %@",
           self.enhancerId, self.enhancerName];
}

@end
