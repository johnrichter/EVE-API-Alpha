//
//  MainWindowController.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/13/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "MainWindowController.h"

@interface MainWindowController ()

@end

@implementation MainWindowController

- (id)initWithWindow:(NSWindow *)window
{
   self = [super initWithWindow:window];
   if (self)
   {
      // Character APIs
      [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(EVEApiKeyInformationDidLoad:)
                                                 name:NSStringFromClass([EVEApiKeyInformation class])
                                               object:nil];

      [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(EVEAccountStatusDidLoad:)
                                                 name:NSStringFromClass([EVEAccountStatus class])
                                               object:nil];

      [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(EVEAccountCharactersDidLoad:)
                                                 name:NSStringFromClass([EVEAccountCharacters class])
                                               object:nil];

      [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(EVEAccountBalanceDidLoad:)
                                                 name:NSStringFromClass([EVEAccountBalance class])
                                               object:nil];

      [[NSNotificationCenter defaultCenter] addObserver:self
                                               selector:@selector(EVEAssetListDidLoad:)
                                                   name:NSStringFromClass([EVEAssetList class])
                                                 object:nil];
      
      [[NSNotificationCenter defaultCenter] addObserver:self
                                               selector:@selector(EVEUpcomingCalendarEventsDidLoad:)
                                                   name:NSStringFromClass([EVEUpcomingCalendarEvents class])
                                                 object:nil];
      
      [[NSNotificationCenter defaultCenter] addObserver:self
                                               selector:@selector(EVECalendarEventAttendeesDidLoad:)
                                                   name:NSStringFromClass([EVECalendarEventAttendees class])
                                                 object:nil];
      
      [[NSNotificationCenter defaultCenter] addObserver:self
                                               selector:@selector(EVECharacterSheetDidLoad:)
                                                   name:NSStringFromClass([EVECharacterSheet class])
                                                 object:nil];
      
      [[NSNotificationCenter defaultCenter] addObserver:self
                                               selector:@selector(EVEContactListDidLoad:)
                                                   name:NSStringFromClass([EVEContactList class])
                                                 object:nil];
      
      [[NSNotificationCenter defaultCenter] addObserver:self
                                               selector:@selector(EVEContactNotificationsDidLoad:)
                                                   name:NSStringFromClass([EVEContactNotifications class])
                                                 object:nil];
      
      [[NSNotificationCenter defaultCenter] addObserver:self
                                               selector:@selector(EVEContractsDidLoad:)
                                                   name:NSStringFromClass([EVEContracts class])
                                                 object:nil];
      
      [[NSNotificationCenter defaultCenter] addObserver:self
                                               selector:@selector(EVEContractItemsDidLoad:)
                                                   name:NSStringFromClass([EVEContractItems class])
                                                 object:nil];
      
      [[NSNotificationCenter defaultCenter] addObserver:self
                                               selector:@selector(EVEContractBidsDidLoad:)
                                                   name:NSStringFromClass([EVEContractBids class])
                                                 object:nil];
      
      // Server APIs
      [[NSNotificationCenter defaultCenter] addObserver:self
                                               selector:@selector(EVEServerStatusDidLoad:)
                                                   name:NSStringFromClass([EVEServerStatus class])
                                                 object:nil];
      
      [[NSNotificationCenter defaultCenter] addObserver:self
                                               selector:@selector(EVECallListDidLoad:)
                                                   name:NSStringFromClass([EVECallList class])
                                                 object:nil];
   }
   
   return self;
}

- (void)windowDidLoad
{
   [super windowDidLoad];
    
   // Implement this method to handle any initialization after your window controller's
   // window has been loaded from its nib file.

   NSString *legacyUserId = @"8695857";
   NSString *legacyLimitedKey = @"F0AD3EC9275C4FE38A90F191FA2B223AF66C79FAF2CF45828340EC5D0E62220E";
   NSString *legacyFullKey = @"7D345E16FC2441309723B9B51768CB0F2DDF9A5D43A74CBFAB7567299F5A306C";
   
   NSString *keyId = @"2696384";
   NSString *vCode = @"4fVh21rc3MtNvraRk4CwtGiuZc6zmMY0JYIxEayjmzH4hkqTVzdyRrDLvDEBEZlk";
   NSString *corpKeyId = @"2594606";
   NSString *corpVCode = @"nei3DTwGZuKmuN8k37ZbwiQB3IuRzuhclmHnTbfKwKMsPMrPb18S3oM6Vq5aurZH";
   NSNumber *minosId = @91779534;
   NSNumber *minosEvent = @0;
   NSNumber *minosContractId = @74186293;
   
   // Character APIs
   self.apiKeyInfo = [[EVEApiKeyInformation alloc] initWithEveKeyId:keyId VCode:vCode];
   
   //[self.apiKeyInfo queryTheApi];
   
   self.accountStatus = [[EVEAccountStatus alloc] initWithEveKeyId:keyId VCode:vCode];
   
   //[self.accountStatus queryTheApi];
   
   self.accountCharacters = [[EVEAccountCharacters alloc] initWithEveKeyId:keyId
                                                                     VCode:vCode];
   //[self.accountCharacters queryTheApi];
   
   self.accountBalance = [[EVEAccountBalance alloc] initWithEveKeyId:keyId
                                                               VCode:vCode
                                                         CharacterId:minosId];
   //[self.accountBalance queryTheApi];
   
   self.assetList = [[EVEAssetList alloc] initWithEveKeyId:keyId
                                                     VCode:vCode
                                               CharacterId:minosId];
   //[self.assetList queryTheApi];
   
   self.upcomingEvents = [[EVEUpcomingCalendarEvents alloc] initWithEveKeyId:legacyUserId
                                                                       VCode:legacyFullKey
                                                                 CharacterId:minosId];
   //[self.upcomingEvents queryTheApi];
   
   self.eventAttendees = [[EVECalendarEventAttendees alloc] initWithEveKeyId:legacyUserId
                                                                       VCode:legacyFullKey
                                                                 CharacterId:minosId
                                                                     eventID:@0];
   //[self.eventAttendees queryTheApi];
   
   self.characterSheet = [[EVECharacterSheet alloc] initWithEveKeyId:keyId
                                                               VCode:vCode
                                                         CharacterId:minosId];
   //[self.characterSheet queryTheApi];
   
   self.contactList = [[EVEContactList alloc] initWithEveKeyId:keyId
                                                         VCode:vCode
                                                   CharacterId:minosId];
   //[self.contactList queryTheApi];
   
   self.contactNotifications = [[EVEContactNotifications alloc] initWithEveKeyId:keyId
                                                                           VCode:vCode
                                                                     CharacterId:minosId];
   //[self.contactNotifications queryTheApi];
   
   self.characterContracts = [[EVEContracts alloc] initWithEveKeyId:keyId
                                                              VCode:vCode
                                                        CharacterId:minosId];
   //[self.characterContracts queryTheApi];
   
   self.contractItems = [[EVEContractItems alloc] initWithEveKeyId:keyId
                                                             VCode:vCode
                                                       CharacterId:minosId
                                                        ContractId:minosContractId];
   //[self.contractItems queryTheApi];
   
   self.contractBids = [[EVEContractBids alloc] initWithEveKeyId:keyId
                                                           VCode:vCode
                                                     CharacterId:minosId];
   [self.contractBids queryTheApi];
   
   // Server APIs
   self.callList = [EVECallList new];
   //[self.callList queryTheApi];
   
   self.serverStatus = [EVEServerStatus new];
   //[self.serverStatus queryTheApi];
}

-(void)dealloc
{
   [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)EVEApiKeyInformationDidLoad:(NSNotification *)notification
{
   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
   [newStr appendString:self.xmlTextView.string];
   [newStr appendFormat:@"%@\n", self.apiKeyInfo];
   [self.xmlTextView setString:newStr];
}

-(void)EVEAccountStatusDidLoad:(NSNotification *)notification
{
   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
   [newStr appendString:self.xmlTextView.string];
   [newStr appendFormat:@"%@\n", self.accountStatus];
   [self.xmlTextView setString:newStr];
}

-(void)EVEAccountCharactersDidLoad:(NSNotification *)notification
{
   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
   [newStr appendString:self.xmlTextView.string];
   [newStr appendFormat:@"%@\n", self.accountCharacters];
   [self.xmlTextView setString:newStr];
}

-(void)EVEAccountBalanceDidLoad:(NSNotification *)notification
{
   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
   [newStr appendString:self.xmlTextView.string];
   [newStr appendFormat:@"%@\n", self.accountBalance];
   [self.xmlTextView setString:newStr];
}

-(void)EVEAssetListDidLoad:(NSNotification *)notification
{
   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
   [newStr appendString:self.xmlTextView.string];
   [newStr appendFormat:@"%@\n", self.assetList];
   [self.xmlTextView setString:newStr];
}

-(void)EVEUpcomingCalendarEventsDidLoad:(NSNotification *)notification
{
   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
   [newStr appendString:self.xmlTextView.string];
   [newStr appendFormat:@"%@\n", self.upcomingEvents];
   [self.xmlTextView setString:newStr];
}

-(void)EVECalendarEventAttendeesDidLoad:(NSNotification *)notification
{
   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
   [newStr appendString:self.xmlTextView.string];
   [newStr appendFormat:@"%@\n", self.eventAttendees];
   [self.xmlTextView setString:newStr];
}

-(void)EVECharacterSheetDidLoad:(NSNotification *)notification
{
   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
   [newStr appendString:self.xmlTextView.string];
   [newStr appendFormat:@"%@\n", self.characterSheet];
   [self.xmlTextView setString:newStr];
}

-(void)EVEContactListDidLoad:(NSNotification *)notification
{
   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
   [newStr appendString:self.xmlTextView.string];
   [newStr appendFormat:@"%@\n", self.contactList];
   [self.xmlTextView setString:newStr];
}

-(void)EVEContactNotificationsDidLoad:(NSNotification *)notification
{
   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
   [newStr appendString:self.xmlTextView.string];
   [newStr appendFormat:@"%@\n", self.contactNotifications];
   [self.xmlTextView setString:newStr];
}

-(void)EVEContractsDidLoad:(NSNotification *)notification
{
   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
   [newStr appendString:self.xmlTextView.string];
   [newStr appendFormat:@"%@\n", self.characterContracts];
   [self.xmlTextView setString:newStr];
}

-(void)EVEContractItemsDidLoad:(NSNotification *)notification
{
   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
   [newStr appendString:self.xmlTextView.string];
   [newStr appendFormat:@"%@\n", self.contractItems];
   [self.xmlTextView setString:newStr];
}

-(void)EVEContractBidsDidLoad:(NSNotification *)notification
{
   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
   [newStr appendString:self.xmlTextView.string];
   [newStr appendFormat:@"%@\n", self.contractBids];
   [self.xmlTextView setString:newStr];
}

// EVE Online APIs Server APIs
-(void)EVECallListDidLoad:(NSNotification *)notification
{
   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
   [newStr appendString:self.xmlTextView.string];
   [newStr appendFormat:@"%@\n", self.callList];
   [self.xmlTextView setString:newStr];
}

-(void)EVEServerStatusDidLoad:(NSNotification *)notification
{
   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
   [newStr appendString:self.xmlTextView.string];
   [newStr appendFormat:@"%@\n", self.serverStatus];
   [self.xmlTextView setString:newStr];
}

@end

/* MDE
 734499
 rnKgT0CsBodEiQXJsxVXE60taTXwyxTLgCuIDv2Vo22HIRTeNWhOX0RCj4TMcI68
 */

/* MD
 Full Access New Api
 1927220
 JVolmWFGtr6wMewZywlpRje3XmRSiI6xKQ6TbOELHEUH7j8vymuim3D62UKOlB6Y
 
 Limited Access Legacy
 8695857
 F0AD3EC9275C4FE38A90F191FA2B223AF66C79FAF2CF45828340EC5D0E62220E
 
 Full Access Legacy
 8695857
 7D345E16FC2441309723B9B51768CB0F2DDF9A5D43A74CBFAB7567299F5A306C
 
 */
