//
//  EVECalendarEvent.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/14/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEDate.h"

@interface EVECalendarEvent : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes

#pragma mark - XML Relationships

// ID of the event
@property (strong) NSNumber *eventId;

// ID of the char/corp/alliance that owns (aka created) the event
@property (strong) NSNumber *ownerId;

// Name of the char/corp/alliance that owns (created) the event.
// Blank when ownerId is 1 ("CCP")
@property (strong) NSString *ownerName;

// Date the event will start
@property (strong) EVEDate *eventDate;

// The name of the event
@property (strong) NSString *eventTitle;

// Duration of the event (in minutes) between 0 and 1440
@property (strong) NSNumber *duration;

// Tells if the event is marked as "important" (1 is TRUE, else FALSE)
@property (strong) NSNumber *importance;

// The response this character has to this event.
// "Undecided", "Accepted", "Declined", "Tentative"
@property (strong) NSString *response;

// Event description
@property (strong) NSString *eventText;

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

@end
