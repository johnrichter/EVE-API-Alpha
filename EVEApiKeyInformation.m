//
//  EVEApiKeyInformation.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/2/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiKeyInformation.h"

@implementation EVEApiKeyInformation

-(EVEApiKeyInformation *)init
{
   self = [super init];
   if (self)
   {
      self.apiKey = [[EVEApiKey alloc] init];
   }
   
   return self;
}

-(void)configureObjectBuilders
{
   
}

-(BOOL)queryTheApi
{
   BOOL success = NO;
   
   return success;
}

@end
