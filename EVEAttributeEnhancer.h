//
//  EVEAttributeEnhancer.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEAttributeEnhancerId.h"
#import "EVEAttributeEnhancerName.h"

@interface EVEAttributeEnhancer : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes

#pragma mark - XML Relationships
@property (strong) EVEAttributeEnhancerId *enhancerId;
@property (strong) EVEAttributeEnhancerName *enhancerName;

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;
-(void)setRelationshipsWithEnhancerIdKeypath:(NSString *)idKeypath
                                 NameKeypath:(NSString *)nameKeypath;

@end
