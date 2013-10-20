//
//  EVECorporationRoleBase.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/16/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECorporationRoleBase.h"

@implementation EVECorporationRoleBase

-(NSString *)description
{
   return [NSString stringWithFormat:@"Corporation Role at Base Name: %@, ID: %@",
           self.roleName, self.roleId];
}

@end
