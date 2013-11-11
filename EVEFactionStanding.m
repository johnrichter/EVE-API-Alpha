//
//  EVEFactionStanding.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/11/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEFactionStanding.h"

@implementation EVEFactionStanding

-(NSString *)description
{
   return [NSString stringWithFormat:@"Faction ID: %@ | Name: %@ | Standing: %@",
           self.entityId, self.entityName, self.standing];
}

@end
