//
//  EVECalendarEventAttendees.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEApiObject.h"


/**
 A call to char/UpcomingCalendarEvents.xml.aspx must be made prior to calling this API. 
 Otherwise you will receive an error:
 216:Calendar Event List not populated with upcoming events. You cannot request any 
 random eventID.
 */
@interface EVECalendarEventAttendees : EVEApiObject <EVEApiObjectProtocol, RequestOperationDelegate>

#pragma mark - XML Properties
@property (strong) NSMutableArray *eventAttendees;

#pragma mark - Instance Properties
@property (strong) NSString *keyId;
@property (strong) NSString *vCode;
@property (strong) NSNumber *characterId;
@property (strong) NSNumber *eventId;

#pragma mark - Instance Methods
-(EVECalendarEventAttendees *)initWithEveKeyId:(NSString *)keyId
                                         VCode:(NSString *)vCode
                                   CharacterId:(NSNumber *)characterId
                                       eventID:(NSNumber *)eventId;
-(void)queryTheApi;

@end
