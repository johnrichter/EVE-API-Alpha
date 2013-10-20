//
//  EVEAttributeEnhancer.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEAttributeEnhancerValue.h"
#import "EVEAttributeEnhancerName.h"

@interface EVEAttributeEnhancer : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes

#pragma mark - XML Relationships
@property (strong) EVEAttributeEnhancerValue *enhancerValue;
@property (strong) EVEAttributeEnhancerName *enhancerName;

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;
-(void)setRelationshipsWithEnhancerValueKeypath:(NSString *)valueKeypath
                                    NameKeypath:(NSString *)nameKeypath;

@end
