//
//  EVESkillInTraining.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"
#import "EVEDate.h"

@interface EVESkillInTraining : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) EVEDate *tqDate;
@property (strong) EVEDate *endDate;
@property (strong) EVEDate *startDate;
@property (strong) NSNumber *typeId;
@property (strong) NSNumber *startSp;
@property (strong) NSNumber *endSp;
@property (strong) NSNumber *toLevel;
@property BOOL isTraining;

#pragma mark - Instance Properties
@property (strong) NSString *keyId;
@property (strong) NSString *vCode;
@property (strong) NSNumber *characterId;

#pragma mark - Instance Methods
-(EVESkillInTraining *)initWithEveKeyId:(NSString *)keyId
                                  VCode:(NSString *)vCode
                            CharacterId:(NSNumber *)characterId;
-(void)queryTheApi;


@end
