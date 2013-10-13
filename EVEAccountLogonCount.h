//
//  EVEAccountLogonCount.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/12/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVEAccountLogonCount : EVEObject

#pragma mark - XML Properties
@property (strong) NSNumber *count;


-(EVEAccountLogonCount *)init;

@end
