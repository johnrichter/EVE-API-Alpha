//
//  BlueprintRelationship.h
//  EveAPI
//
//  Created by Johnathan Richter on 9/26/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectBlueprint.h"

@interface BlueprintRelationship : NSObject

@property (strong) NSString *xmlKeypath;
@property (strong) NSString *objectKeypath;
@property (strong) ObjectBlueprint *blueprintToBuild;

-(BlueprintRelationship *)init;

+(BlueprintRelationship *)relationshipFromXmlKeypath:(NSString *)xmlKeypath
                                     ToObjectKeypath:(NSString *)objectKeypath
                                        ForBlueprint:(ObjectBlueprint *)blueprint;

@end
