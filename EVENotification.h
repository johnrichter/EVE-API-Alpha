//
//  EVENotification.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/28/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEDate.h"

@interface EVENotification : EVEObject <EVEObjectProtocol>

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *notificationId;
@property (strong) NSNumber *typeId;
@property (strong) NSNumber *senderId;
@property (strong) EVEDate *dateSent;
@property (strong) NSString *additionalInformation;
@property BOOL hasBeenRead;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

-(void)configureObjectBlueprint;

/** 
 notificationId Table
 **************
1	Legacy
2	Character deleted
3	Give medal to character
4	Alliance maintenance bill
5	Alliance war declared
6	Alliance war surrender
7	Alliance war retracted
8	Alliance war invalidated by Concord
9	Bill issued to a character
10	Bill issued to corporation or alliance
11	Bill not paid because there's not enough ISK available
12	Bill, issued by a character, paid
13	Bill, issued by a corporation or alliance, paid
14	Bounty claimed
15	Clone activated
16	New corp member application
17	Corp application rejected
18	Corp application accepted
19	Corp tax rate changed
20	Corp news report, typically for shareholders
21	Player leaves corp
22	Corp news, new CEO
23	Corp dividend/liquidation, sent to shareholders
24	Corp dividend payout, sent to shareholders
25	Corp vote created
26	Corp CEO votes revoked during voting
27	Corp declares war
28	Corp war has started
29	Corp surrenders war
30	Corp retracts war
31	Corp war invalidated by Concord
32	Container password retrieval
33	Contraband or low standings cause an attack or items being confiscated
34	First ship insurance
35	Ship destroyed, insurance payed
36	Insurance contract invalidated/runs out
37	Sovereignty claim fails (alliance)
38	Sovereignty claim fails (corporation)
39	Sovereignty bill late (alliance)
40	Sovereignty bill late (corporation)
41	Sovereignty claim lost (alliance)
42	Sovereignty claim lost (corporation)
43	Sovereignty claim acquired (alliance)
44	Sovereignty claim acquired (corporation)
45	Alliance anchoring alert
46	Alliance structure turns vulnerable
47	Alliance structure turns invulnerable
48	Sovereignty disruptor anchored
49	Structure won/lost
50	Corp office lease expiration notice
51	Clone contract revoked by station manager
52	Corp member clones moved between stations
53	Clone contract revoked by station manager
54	Insurance contract expired
55	Insurance contract issued
56	Jump clone destroyed
57	Jump clone destroyed
58	Corporation joining factional warfare
59	Corporation leaving factional warfare
60	Corporation kicked from factional warfare on startup because of too low standing to the faction
61	Character kicked from factional warfare on startup because of too low standing to the faction
62	Corporation in factional warfare warned on startup because of too low standing to the faction
63	Character in factional warfare warned on startup because of too low standing to the faction
64	Character loses factional warfare rank
65	Character gains factional warfare rank
66	Agent has moved
67	Mass transaction reversal message
68	Reimbursement message
69	Agent locates a character
70	Research mission becomes available from an agent
71	Agent mission offer expires
72	Agent mission times out
73	Agent offers a storyline mission
74	Tutorial message sent on character creation
75	Tower alert
76	Tower resource alert
77	Station service aggression message
78	Station state change message
79	Station conquered message
80	Station aggression message
81	Corporation requests joining factional warfare
82	Corporation requests leaving factional warfare
83	Corporation withdrawing a request to join factional warfare
84	Corporation withdrawing a request to leave factional warfare
85	Corporation liquidation
86	Territorial Claim Unit under attack
87	Sovereignty Blockade Unit under attack
88	Infrastructure Hub under attack
89	Contact add notification
90	Contact edit notification
91	Incursion Completed
92	Corp Kicked
93	Customs office has been attacked
94	Customs office has entered reinforced
95	Customs office has been transferred
96	FW Alliance Warning
97	FW Alliance Kick
98	AllWarCorpJoined Msg
99	Ally Joined Defender
100	Ally Has Joined a War Aggressor
101	Ally Joined War Ally
102	New war system: entity is offering assistance in a war.
103	War Surrender Offer
104	War Surrender Declined
105	FacWar LP Payout Kill
106	FacWar LP Payout Event
107	FacWar LP Disqualified Eventd
108	FacWar LP Disqualified Kill
109	Alliance Contract Cancelled
110	War Ally Declined Offer
111	Your Bounty Claimed
112	Bounty Placed (Char)
113	Bounty Placed (Corp)
114	Bounty Placed (Alliance)
115	Kill Right Available
116	Kill Right Available Open
117	Kill Right Earned
118	Kill Right Used
119	Kill Right Unavailable
120	Kill Right Unavailable Open
121	Declare War
122	Offered Surrender
123	Accepted Surrender
124	Made War Mutual
125	Retracts War
126	Offered To Ally
127	Accepted Ally
128	Character Application Accept Message
129	Character Application Reject Message
130	Character Application Withdraw Message

 
 Additional Information Detail
 Depending on the type of the notification there is structured data available in the 
 notification. The time outputed by some of the notifications is formatted to Microsoft's 
 version of epoch time, the formula to convert this to unix epoch is: 
 $x = ($v / 10000000) - 11644473600; where $v is the time returned in the notification text.
 
 16 - New corp member application
 applicationText	An HTML-formatted reason given by the applicant for joining the 
 corporation. May be surrounded by single quotes (') where the rationale contains colons (:).
 charID	The identifier of the applicant's character
 corpID	The identifier of the corporation receiving the application
 
 19 - Corp tax rate changed
 corpID	The identifier of the corporation affected by the tax rate change
 newTaxRate	The tax rate, as a percentage, applicable after the change, expressed as a 
 rational number to one decimal place (with a leading or trailing zero if necessary)
 oldTaxRate	The tax rate that applied prior to the change
 
 69 - Agent locates a character
 agentLocation	 3	Region of the locator agent
                4	Constellation of the locator agent
                5	Solarsystem of the locator agent
               15	Station of the agent
            x/y/z	Coordinates of the locator agent
 
 characterID		characterID of the target
 
 messageIndex
 
 targetLocation	 3	Region of the target
                   4	Constellation of the target
                   5	Solarsystem of the target
                   6	Shipname of the target
                  15	Station of the target
               x/y/z	Coordinates of the target (if not in station)
 
 130 - Character Application Withdraw Message
 The format is the same as for new member applications.
 
 */
@end
