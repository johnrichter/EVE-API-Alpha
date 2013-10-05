//
//  EVEObjectProtocol.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/4/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EVEObjectProtocol <NSObject>

@required

-(void)configureObjectBlueprint;

@end

//
//  EVEApi.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/4/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEDate.h"

@interface EVEApi : EVEObject <EVEObjectProtocol>

#pragma mark - Common XML Attributes
@property (strong) NSNumber *apiVersion;

#pragma mark - Common XML Properties
@property (strong) EVEDate *lastQueried;
@property (strong) EVEDate *cachedUntil;

#pragma mark - EVEObjectProtocol Methods
-(void)configureObjectBlueprint;

@end


//
//  EVEApi.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/4/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApi.h"

@implementation EVEApi

-(EVEApi *)init
{
   self = [super init];
   if (self)
   {
      // XML Properties
      self.lastQueried = [[EVEDate alloc] init];
      self.cachedUntil = [[EVEDate alloc] init];
      self.apiVersion = @2;
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   // Create the main blueprint for our api object
   self.apiBlueprint = [[ObjectBlueprint alloc] initWithClass:[self class]
                                                      KeyPath:@"eveapi"
                                                   Attributes:@{@"version":@"apiVersion"}];
   
   // Create our lastQueried relationship
   ObjectBlueprint *currentTime = _lastQueried.objectBlueprint;
   [currentTime setXmlKeypath:@"eveapi.currentTime"];
   
   BlueprintRelationship *currentTimeRelationship =
   [BlueprintRelationship relationshipFromXmlKeypath:@"currentTime"
                        RelativeToObjectWithProperty:@"lastQueried"
                                        ForBlueprint:currentTime];
   
   // Create our cachedUntil relationship
   ObjectBlueprint *cachedUntil = _cachedUntil.objectBlueprint;
   [cachedUntil setXmlKeypath:@"eveapi.cachedUntil"];
   
   BlueprintRelationship *cachedUntilRelationship =
   [BlueprintRelationship relationshipFromXmlKeypath:@"cachedUntil"
                        RelativeToObjectWithProperty:@"cachedUntil"
                                        ForBlueprint:currentTime];
}

@end