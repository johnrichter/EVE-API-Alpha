//
//  EVENpcCorporationStanding.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/11/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVENpcCorporationStanding.h"

@implementation EVENpcCorporationStanding

-(NSString *)description
{
   return [NSString stringWithFormat:@"NPC Corporation ID: %@ | Name: %@ | Standing: %@",
           self.entityId, self.entityName, self.standing];
}

@end
