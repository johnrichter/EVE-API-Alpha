//
//  EVEWalletTransactions.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEWalletTransactions.h"
#import "EVEWalletTransactionEntry.h"

@interface EVEWalletTransactions ()

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

@end

@implementation EVEWalletTransactions

#pragma mark - Instance Methods

-(EVEWalletTransactions *)initWithEveKeyId:(NSString *)keyId
                                     VCode:(NSString *)vCode
                               CharacterId:(NSNumber *)characterId
                                  WalletId:(NSNumber *)walletId
{
   self = [super init];
   if (self)
   {
      // Instance Properties
      self.keyId = keyId;
      self.vCode = vCode;
      self.characterId = characterId;
      self.walletId = walletId;
      self.maxEntriesPerCall = @2560;
      self.entrySortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"transactionId"
                                                                ascending:NO]];
      
      // Common API Properties
      self.commonName = @"Wallet Transactions";
      [self.uri appendString:@"corp/WalletTransactions.xml.aspx"];
      [self.uriArguments addEntriesFromDictionary:
         @{@"keyID":keyId,
           @"vCode":vCode,
           @"characterID":[characterId stringValue],
           @"accountKey":[walletId stringValue],
           @"rowCount":[self.maxEntriesPerCall stringValue]}];

      self.cakAccessMask = @4194304;
      self.cacheStyle = kShortCache;
      self.legacyApiRestriction = kFullAccess;
      self.isLegacyApiKeyEnabled = NO;
      
      // Built Object Properties
      self.transactions = [NSMutableOrderedSet new];
      
      // Object Building Properties
      [self configureObjectBuilders];
   }
   
   return self;
}

-(void)queryTheApi
{
   [self.requestOperation start];
}

-(NSString *)description
{
   NSMutableString *api = [NSMutableString stringWithFormat:
                           @"%@ - Version %@\n\n"
                           @"URI:\t\t\t\t\t\t%@\n"
                           @"Legacy API Enabled:\t\t\t%s\n"
                           @"Legacy API Restriction:\t\t%@\n"
                           @"CAK Access Mask Required:\t%@\n"
                           @"Date Last Queried:\t\t\t%@\n"
                           @"Cached Until:\t\t\t\t%@\n"
                           @"Cache Style:\t\t\t\t%@\n"
                           @"API Error:\t\t\t\t\t%@\n\n",
                           self.commonName,
                           self.apiVersion,
                           self.uri,
                           self.isLegacyApiKeyEnabled ? "Yes":"No",
                           [EVEApiObject legacyApiRestrictionToString:self.legacyApiRestriction],
                           self.cakAccessMask,
                           self.lastQueried,
                           self.cachedUntil,
                           [EVEApiObject cacheStyleToString:self.cacheStyle],
                           self.apiError];
   
   for (id object in self.transactions)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   return api;
}

-(BOOL)walkTheTransactionsBackwards:(unsigned int)entriesRetreivedLastCall
{
   // Sort the entries
   [self.transactions sortUsingDescriptors:self.entrySortDescriptors];
   
   // We retrieved less than the max number of entries last call so we are finished
   if (entriesRetreivedLastCall < [self.maxEntriesPerCall unsignedIntegerValue])
   {
      NSLog(@"Transaction walk finished.  Total entries: %lu",
            (unsigned long)[self.transactions count]);
      
      return YES;  // We are done walking the transactions
   }
   
   // We retrieved the max number of entries last call so we need to continue walking
   else
   {
      EVEWalletTransactionEntry *lastObject = [self.transactions lastObject];
      
      [self.uriArguments addEntriesFromDictionary:
         @{@"beforeTransID":[lastObject.transactionId stringValue]}];
      
      // Create a new RequestOperation
      self.requestOperation = [[RequestOperation alloc] initWithDelegate:self];
      
      // Configure our RequestOperation with URI and Arguements
      [self.requestOperation setUrl:self.uri
                     WithArguements:self.uriArguments
                         Blueprints:self.objectBlueprints];
      
      NSLog(@"Attempting to walk backwards.  Current entries: %u",
            entriesRetreivedLastCall);
      
      // Asynchronously fetch the next wallet journal entry page
      [self.requestOperation start];
      
      return NO;
   }
}

#pragma mark - EVEApiProtool Methods

-(void)configureObjectBuilders
{
   ObjectBlueprint *transaction = [[EVEWalletTransactionEntry new] objectBlueprint];
   [transaction setXmlKeypath:@"eveapi.result.rowset.row"];
   
   // Add the blueprints to our collection
   [self.objectBlueprints addObject:transaction];
   
   // Configure our RequestOperation with URI and Arguements
   [self.requestOperation setUrl:self.uri
                  WithArguements:self.uriArguments
                      Blueprints:self.objectBlueprints];
}

#pragma mark - RequestOperationProtocolMethods

-(void)requestOperationSucceededWithObjects:(NSArray *)objects
{
   // Call our base classes protocol function
   [super requestOperationSucceededWithObjects:objects];
   
   unsigned int entriesRetrieved = 0;
   for (id object in objects)
   {
      if ([object class] == [EVEWalletTransactionEntry class])
      {
         [self.transactions addObject:object];
         entriesRetrieved += 1;
      }
   }
   
   BOOL isFinishedWalking = [self walkTheTransactionsBackwards:entriesRetrieved];
   
   if (isFinishedWalking)
   {
      [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromClass([self class])
                                                          object:nil
                                                        userInfo:nil];
   }
}

-(void)requestOperationFailedWithError:(NSError *)error;
{
   [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromClass([self class])
                                                       object:nil
                                                     userInfo:@{@"error":error}];
}


@end
