//
//  EVEApiKeyInformation.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/2/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//
/*
 <?xml version='1.0' encoding='UTF-8'?>
<eveapi version="2">
<currentTime>2011-09-10 14:41:29</currentTime>
<result>
<key accessMask="59760264" type="Character" expires="2011-09-11 00:00:00">
<rowset name="characters" key="characterID" columns="characterID,characterName,corporationID,corporationName">
<row characterID="898901870" characterName="Desmont McCallock" corporationID="1000009" corporationName="Caldari Provisions" />
</rowset>
</key>
</result>
<cachedUntil>2011-09-10 14:46:29</cachedUntil>
</eveapi>
*/

#import <Foundation/Foundation.h>
#import "EVEApiObject.h"
#import "EVEApiKey.h"

@interface EVEApiKeyInformation : EVEApiObject <EVEApiObjectProtocol, RequestOperationProtocol>

#pragma mark - XML Properties
@property (strong) EVEApiKey *apiKey;

-(EVEApiKeyInformation *)initWithUriArguements:(NSDictionary *)arguements;

-(BOOL)queryTheApi;

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

@end
