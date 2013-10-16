//
//  EVEIntelligenceEnhancer.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEIntelligenceEnhancer.h"

@implementation EVEIntelligenceEnhancer

#pragma mark - Instance Methods

-(NSString *)description
{
   return [NSString stringWithFormat:@"Intelligence Enhancer Id: %@ | Name: %@",
           self.enhancerId, self.enhancerName];
}

@end
