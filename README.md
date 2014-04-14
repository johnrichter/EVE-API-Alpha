#### This project has been deprecated.  Please read the README, develop, and use [EVE-API](https://github.com/jrichte43/EVE-API).

# Why Alpha?

Alpha is the original prototype I developed to process the EVE Online API.  I was learning Objective-C while at the same time processing large XML documents concurrently, processing them into in-memeory structures, and converting them into real objects via reflection (which I was also learning about).  It got messy, but the point was to figure out how the pieces fit, how they are processed, and what doesn't make sense.  

In the end of Alpha I hit a major complexity roadblock.  My builder routines were becoming too case-specific and I kept running into edge cases that a good design should deal with MUCH more elegantly so I went back to the drawing board, refactored some code, and changed the way the builder looked at and processed the XML.  This re-engineering effort took less than a week, got rid of _hundreds_ of lines of code, and ran much faster.  Migration to the new XML processing engine, XMLKit2, was made very simple with a few convention changes.  The next optimization I have to perform on this engine (at the link above) is space.  While building the XML in dictionaries makes sense logically, it isn't the most space concious.

## How to use

Currently the 'library' is being built as an executable for ease of quick testing.  In near future unit tests will be created for each object and function that makes up EVE API, but until then we can query the APIs and manually verify the results.

In ```/EVEApi/MainWindowController.m``` there are 3 sections that run the program. Each section is defined below.

- ```-(id)initWithWindow:(NSWindow *)window;```
  * This section registers the ```-(void)EVE*DidLoad``` callback functions to be called when certain EVEApi's have received and processed their data either successfully or unsuccessfully.
- ```-(void)windowDidLoad;```
 * This section defines what API's you will be calling and is most useful for running the program to see what it can do.  The EVE Online API server required a key ID and a verification code (vCode) to access most of the data.  Since you have to be a player to generate these IDs and vCodes I have created variables in the project that have similar names and must be matched for the call to work.  Ex: ```minosId and minosContractID (keyID, vCode, corpKeyID, and corpVCode are all used with minos)```.  For the API's implemented in the code I have set each to use a pair that should retrieve data, but you may swap them out for other matched pairs to see what you can get.  Currently, the project is set to retrieve a list of all Alliances in the game.
 * To change the API being called you will want to comment out the ```[api queryTheApi];``` message of the current one being called and uncomment another API that has the same message call.  For example: 
```
self.allianceList = [EVEAllianceList new];
[self.allianceList queryTheApi];                    // Comment this line out
  
self.charNameToId = [[EVECharacterNameToId alloc] initWithNames:@[@"Minos%20Daedalus",
                                                                  @"Master%20DarkEnforcer"]];
//[self.charNameToId queryTheApi];                  // Comment this line back in
```
- ```-(void)EVE*DidLoad;```
 - This section contains all the implementations of the API centric callback functions.  All of these functions use the same NSTextView when being called.  Since all of the API's call their respective URL's in an asynchronous fashion, this text view is not thread safe.  The majority of time it does work correctly when calling multiple API's at once.  This is a limitation of the test application and not the library.


