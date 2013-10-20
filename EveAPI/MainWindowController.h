//
//  MainWindowController.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/13/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// Account APIs
#import "EVEApiKeyInformation.h"
#import "EVEAccountStatus.h"
#import "EVEAccountCharacters.h"

// Character APIs
#import "EVEAccountBalance.h"
#import "EVEAssetList.h"
#import "EVECalendarEventAttendees.h"
#import "EVEUpcomingCalendarEvents.h"
#import "EVECharacterSheet.h"

@interface MainWindowController : NSWindowController

@property (strong) IBOutlet NSTextView *xmlTextView;

@property (strong) EVEApiKeyInformation *apiKeyInfo;
@property (strong) EVEAccountStatus *accountStatus;
@property (strong) EVEAccountCharacters *accountCharacters;
@property (strong) EVEAccountBalance *accountBalance;
@property (strong) EVEAssetList *assetList;
@property (strong) EVEUpcomingCalendarEvents *upcomingEvents;
@property (strong) EVECalendarEventAttendees *eventAttendees;
@property (strong) EVECharacterSheet *characterSheet;

@end
