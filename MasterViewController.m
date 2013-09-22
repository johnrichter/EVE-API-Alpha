//
//  MasterViewController.m
//  EveAPI
//
//  Created by Johnathan Richter on 7/13/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "MasterViewController.h"
#import "XMLFactory.h"
#import "ObjectBlueprint.h"
#import "RequestOperation.h"
#import "EVECharacter.h"

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
    
   //NSURL *url = [NSURL URLWithString:@"https://api.eveonline.com/account/APIKeyInfo.xml.aspx?keyID=1927220&vCode=JVolmWFGtr6wMewZywlpRje3XmRSiI6xKQ6TbOELHEUH7j8vymuim3D62UKOlB6Y"];
   //NSURL *url = [NSURL URLWithString:@"https://api.eveonline.com/char/WalletJournal.xml.aspx?keyID=1927220&vCode=JVolmWFGtr6wMewZywlpRje3XmRSiI6xKQ6TbOELHEUH7j8vymuim3D62UKOlB6Y&characterID=91836741&rowCount=25"];
   NSURL *url = [NSURL URLWithString:@"https://api.eveonline.com/char/AssetList.xml.aspx?keyID=1927220&vCode=JVolmWFGtr6wMewZywlpRje3XmRSiI6xKQ6TbOELHEUH7j8vymuim3D62UKOlB6Y&characterID=91836741"];
   
   ObjectBlueprint *character = [[ObjectBlueprint alloc]
                                 initWithClass:[EVECharacter class]
                                 KeyPath:@"eveapi.result.key.rowset.row"
                                 Attributes:@{@"characterID":@"characterId",
                                              @"characterName":@"characterName",
                                              @"corporationID":@"@corporationId",
                                              @"corporationName":@"corporationName"}
                                 HasValue:NO];
   
   RequestOperation * myOperation = [[RequestOperation alloc]
                                     initWithUrl:url
                                     Blueprints:@[character]];
   
   [myOperation start];
}

@end
