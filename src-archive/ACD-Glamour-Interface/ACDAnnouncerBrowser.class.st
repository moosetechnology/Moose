Class {
	#name : #ACDAnnouncerBrowser,
	#superclass : #GLMCompositePresentation,
	#instVars : [
		'debugger'
	],
	#category : #'ACD-Glamour-Interface'
}

{ #category : #building }
ACDAnnouncerBrowser >> announcementIn: aComposite [ 

	"Not such a nice way to reuse the code"
	GTObjectVariablesBrowser new variablesIn: aComposite.
	aComposite presentations last 
		title: 'Announcement';
		display: [ :aSession | aSession announcement gtInspectorVariableValuePairs ];
		selectionAct: [ :aPresentation |  aPresentation selection explore] on: $i entitled: 'Explore'
]

{ #category : #building }
ACDAnnouncerBrowser >> announcerIn: aComposite [ 

	"Not such a nice way to reuse the code"
	GTObjectVariablesBrowser new variablesIn: aComposite.
	aComposite presentations last 
		title: 'Announcer';
		display: [ :aSession | aSession announcer gtInspectorVariableValuePairs ];
		selectionAct: [ :aPresentation |  aPresentation selection explore] on: $i entitled: 'Explore' 


]

{ #category : #accessing }
ACDAnnouncerBrowser >> browser [ 

	^ self presentations first
]

{ #category : #building }
ACDAnnouncerBrowser >> componentsIn: aComposite [ 

	self 
		subscriptionsIn: aComposite;
		announcementIn: aComposite;
		announcerIn: aComposite
]

{ #category : #building }
ACDAnnouncerBrowser >> compose [

	self tabulator with: [:browser | 
		browser row: #components.
		browser transmit to: #components; andShow: [:aComposite | 
			self componentsIn: aComposite ].
		
		browser transmit from: #components port: #strongSelection; toOutsidePort: #selection ]
]

{ #category : #accessing }
ACDAnnouncerBrowser >> debugger [

	^ debugger
]

{ #category : #accessing }
ACDAnnouncerBrowser >> debugger: anObject [

	debugger := anObject 
]

{ #category : #'building actions' }
ACDAnnouncerBrowser >> installSubscriptionsActionsIn: aPresentation [ 

	self debugger installActionsForRootPragmas: { #ACDSubscriptionDebuggingAction } in: aPresentation
]

{ #category : #private }
ACDAnnouncerBrowser >> printAnnouncementTypeFor: anAnnouncementType [
 
	^ anAnnouncementType isCollection 
		ifTrue: [
			String streamContents: [:s | anAnnouncementType printElementsOn: s]] 
		ifFalse: [
			anAnnouncementType printString]
]

{ #category : #accessing }
ACDAnnouncerBrowser >> selectedSubscription [

	^ ((self browser paneNamed: #components) port: #selection)  value
]

{ #category : #accessing }
ACDAnnouncerBrowser >> session [

	^ self debugger session 
]

{ #category : #building }
ACDAnnouncerBrowser >> subscriptionsIn: aComposite [ 

	aComposite table
		title: 'Subscriptions';
		showOnly: 100;
		display: [ :aSession | aSession activeSubscriptions ];
		column: 'Announcement Type' evaluated: [ :aSubscription | 
			Text 
				string: (self printAnnouncementTypeFor: aSubscription announcementClass )
				attributes: (self textAttributesForSubscription: aSubscription) ];
		column: 'Action' evaluated: [ :aSubscription | 
			Text 
				string: (aSubscription action printString )
				attributes: (self textAttributesForSubscription: aSubscription) ];
		selectionAct: [:each |  each selection explore] on: $i entitled: 'Explore';
		with: [ :presentation |
			self installSubscriptionsActionsIn: presentation ]
]

{ #category : #private }
ACDAnnouncerBrowser >> textAttributesForSubscription: aSubscription [ 

	(self session executingSubscription == aSubscription) 
		ifTrue: [ ^ {TextEmphasis bold} ].
		
	(self session hasSubscriptionExecuted: aSubscription )
		ifTrue: [ ^ {TextColor color: Color lightGray. TextEmphasis italic} ].
		
	^ {TextColor black}
]
