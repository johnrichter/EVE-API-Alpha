//
//  EVEMemoryEnhancer.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEMemoryEnhancer.h"
#import "BlueprintRelationship.h"

@interface EVEMemoryEnhancer ()

@end

@implementation EVEMemoryEnhancer

#pragma mark - Instance Methods

-(NSString *)description
{
   return [NSString stringWithFormat:@"Memory Enhancer Id: %@ | Name: %@",
                                     self.enhancerValue, self.enhancerName];
}

@end
