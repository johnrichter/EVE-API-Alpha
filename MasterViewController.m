//
//  MasterViewController.m
//  EveAPI
//
//  Created by Johnathan Richter on 7/13/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "MasterViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
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
    }
    
    return self;
}

-(void)dealloc
{
   [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)loadView
{
   [super loadView];
   NSString *keyId = @"1927220";
   NSString *vCode = @"JVolmWFGtr6wMewZywlpRje3XmRSiI6xKQ6TbOELHEUH7j8vymuim3D62UKOlB6Y";
   
   self.apiKeyInfo =
   [[EVEApiKeyInformation alloc] initWithEveKeyId:keyId VCode:vCode];
   
   [self.apiKeyInfo queryTheApi];
   
   self.accountStatus =
   [[EVEAccountStatus alloc] initWithEveKeyId:keyId VCode:vCode];
   
   [self.accountStatus queryTheApi];
   
   self.accountCharacters =
   [[EVEAccountCharacters alloc] initWithEveKeyId:keyId VCode:vCode];
   
   [self.accountCharacters queryTheApi];
}

-(void)EVEApiKeyInformationDidLoad:(NSNotification *)notification
{
   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
   [newStr appendString:self.xmlTextView.string];
   [newStr appendFormat:@"%@", self.apiKeyInfo];
   [self.xmlTextView setString:newStr];
}

-(void)EVEAccountStatusDidLoad:(NSNotification *)notification
{
   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
   [newStr appendString:self.xmlTextView.string];
   [newStr appendFormat:@"%@", self.accountStatus];
   [self.xmlTextView setString:newStr];
}

-(void)EVEAccountCharactersDidLoad:(NSNotification *)notification
{
   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
   [newStr appendString:self.xmlTextView.string];
   [newStr appendFormat:@"%@", self.accountCharacters];
   [self.xmlTextView setString:newStr];
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

