//
//  EVEObject.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/4/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@implementation EVEObject

-(EVEObject *)init
{
   self = [super init];
   if (self)
   {
      self.objectBlueprint = [[ObjectBlueprint alloc] init];
   }
   
   return self;
}

@end
