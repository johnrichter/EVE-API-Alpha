//
//  EVEObject.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/4/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectBlueprint.h"

@interface EVEObject : NSObject

#pragma mark - Blueprint
@property (strong) ObjectBlueprint *objectBlueprint;

@end
