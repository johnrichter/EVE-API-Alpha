//
//  MasterViewController.m
//  EveAPI
//
//  Created by Johnathan Richter on 7/13/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "MasterViewController.h"
#import "EVEApiKeyInformation.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Initialization code here.
    }
    
    return self;
}

-(void)loadView
{
    [super loadView];
    
    [self.xmlTextView setString:@"Hello World!"];
    
   NSURL *url = [NSURL URLWithString:@"https://api.eveonline.com/account/APIKeyInfo.xml.aspx?keyID=1927220&vCode=JVolmWFGtr6wMewZywlpRje3XmRSiI6xKQ6TbOELHEUH7j8vymuim3D62UKOlB6Y"];
   //NSURL *url = [NSURL URLWithString:@"https://api.eveonline.com/char/WalletJournal.xml.aspx?keyID=1927220&vCode=JVolmWFGtr6wMewZywlpRje3XmRSiI6xKQ6TbOELHEUH7j8vymuim3D62UKOlB6Y&characterID=91836741&rowCount=25"];
   //NSURL *url = [NSURL URLWithString:@"https://api.eveonline.com/char/AssetList.xml.aspx?keyID=1927220&vCode=JVolmWFGtr6wMewZywlpRje3XmRSiI6xKQ6TbOELHEUH7j8vymuim3D62UKOlB6Y/Users/richte43/Documents/Xcode Projects/EveAPI/EVEApi.m&characterID=91836741"];
   
   self.apiKeyInfo =
   [[EVEApiKeyInformation alloc]
    initWithUriArguements:
      @{@"keyID":@"1927220",
        @"vCode":@"JVolmWFGtr6wMewZywlpRje3XmRSiI6xKQ6TbOELHEUH7j8vymuim3D62UKOlB6Y"}];
   
   [self.apiKeyInfo addObserver:self
                forKeyPath:@"apiKey"
                   options:NSKeyValueObservingOptionNew
                   context:NULL];
   
   if ([self.apiKeyInfo queryTheApi])
   {
      [self.xmlTextView setString:[NSString stringWithFormat:@"%@", self.apiKeyInfo]];
   }
   else
   {
      [self.xmlTextView setString:@"Oh noes! Error."];
   }
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context
{
   if ([keyPath isEqualToString:@"apiKey"] && object)
   {
      [self.xmlTextView setString:[NSString stringWithFormat:@"%@", object]];
   }
}

@end
