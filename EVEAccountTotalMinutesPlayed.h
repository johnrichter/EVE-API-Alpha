//
//  EVEAccountTotalMinutesPlayed.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/12/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVEAccountTotalMinutesPlayed : EVEObject

#pragma mark - XML Properties
@property (strong) NSNumber *totalMinutes;

-(EVEAccountTotalMinutesPlayed *)init;

@end
