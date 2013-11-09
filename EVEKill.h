//
//  EVEKill.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/8/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEDate.h"
#import "EVEKillVictim.h"
#import "EVEKillAttackers.h"
#import "EVEKillItems.h"

@interface EVEKill : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *killId;
@property (strong) NSNumber *solarSystemId;
@property (strong) NSNumber *moonId;
@property (strong) EVEDate *killTime;

#pragma mark - XML Relationships
@property (strong) EVEKillVictim *victim;
@property (strong) EVEKillAttackers *attackers;
@property (strong) EVEKillItems *items;


#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

-(void)setVictimRelationKeypath:(NSString *)keypath;

-(void)setAttackersRelationKeypath:(NSString *)attackersKeypath
                MatchingAttributes:(NSDictionary *)attributes
                   AttackerKeypath:(NSString *)attackerKeypath;

-(void)setItemsRelationKeypath:(NSString *)itemsKeypath
            MatchingAttributes:(NSDictionary *)attributes
                   ItemKeypath:(NSString *)itemKeypath
         ContainedItemsKeypath:(NSString *)containedKeypath;

@end
