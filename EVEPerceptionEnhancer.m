//
//  EVEPerceptionEnhancer.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEPerceptionEnhancer.h"
#import "BlueprintRelationship.h"

@interface EVEPerceptionEnhancer ()

@end

@implementation EVEPerceptionEnhancer

#pragma mark - Instance Methods

-(NSString *)description
{
   return [NSString stringWithFormat:@"Perception Enhancer Id: %@ | Name: %@",
           self.enhancerValue, self.enhancerName];
}

@end
