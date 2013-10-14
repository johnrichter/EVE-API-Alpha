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
      // Initialization code here.

      //       [self.scrollView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
      //
      //       [self.xmlTextView setMaxSize:NSMakeSize(FLT_MAX, FLT_MAX)];
      //       [self.xmlTextView setVerticallyResizable:YES];
      //       [self.xmlTextView setHorizontallyResizable:YES];
      //       [self.xmlTextView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
      //       [[self.xmlTextView textContainer] setWidthTracksTextView:YES];
      //       [[self.xmlTextView textContainer] setHeightTracksTextView:YES];

      // Initialization code here.
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
   }
   return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
   
   NSString *keyId = @"1927220";
   NSString *vCode = @"JVolmWFGtr6wMewZywlpRje3XmRSiI6xKQ6TbOELHEUH7j8vymuim3D62UKOlB6Y";
   NSNumber *minosId = @91779534;
   
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
   [self.assetList queryTheApi];
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
   
   //[self updateTextView];
}

@end

/* MDE
 734499
 rnKgT0CsBodEiQXJsxVXE60taTXwyxTLgCuIDv2Vo22HIRTeNWhOX0RCj4TMcI68
 */

/* MD
 1927220
 JVolmWFGtr6wMewZywlpRje3XmRSiI6xKQ6TbOELHEUH7j8vymuim3D62UKOlB6Y
 */
