//
//  EVECorporationRoleOther.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/16/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECorporationRoleOther.h"

@implementation EVECorporationRoleOther

-(NSString *)description
{
   return [NSString stringWithFormat:@"Corporation Role at Other Name: %@, ID: %@",
           self.roleName, self.roleId];
}

@end
