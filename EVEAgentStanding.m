//
//  EVEAgentStanding.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/11/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEAgentStanding.h"

@implementation EVEAgentStanding

-(NSString *)description
{
   return [NSString stringWithFormat:@"Agent ID: %@ | Name: %@ | Standing: %@",
                                     self.entityId, self.entityName, self.standing];
}

@end
