Class {
	#name : #ACDContextLocator,
	#superclass : #Object,
	#instVars : [
		'context'
	],
	#category : #'ACD-Model'
}

{ #category : #'as yet unclassified' }
ACDContextLocator class >> forContext: aContext [

	^ self new forContext: aContext
]

{ #category : #'accessing actions' }
ACDContextLocator >> extractActiveSubscriptions [

	^ context ifNotNilDo: [:aContext| aContext tempNamed: 'subs']
]

{ #category : #'accessing actions' }
ACDContextLocator >> extractAnnouncement [

	^ context ifNotNilDo: [:aContext| aContext tempNamed: 'anAnnouncement']
]

{ #category : #'accessing actions' }
ACDContextLocator >> extractExecutingSubscription [
	
	^ context ifNotNilDo: [:aContext|
		(aContext tempNamed: 'subs') at: (aContext tempNamed: 'index')  ]
]

{ #category : #'accessing actions' }
ACDContextLocator >> extractExecutingSubscriptionIndex [

	^ context ifNotNilDo: [:aContext| aContext tempNamed: 'index' ]
]

{ #category : #private }
ACDContextLocator >> filterFailed [

	context := nil
]

{ #category : #private }
ACDContextLocator >> findContextSuchThat: testBlock [

	^ context 
		ifNil: [ nil ] 
		ifNotNil: [ context := context findContextSuchThat: testBlock ]
	
]

{ #category : #initialization }
ACDContextLocator >> forContext: aContext [

	context := aContext 
]

{ #category : #actions }
ACDContextLocator >> locateAnnouncementDelivery [
	"Locate the context responsible with initiating the delivery of a subscription.
	From this context the active subscriptions and the current executing subscription,
	should be extracted."
	
	^ self 
		skipUntilSubscriptionDeliveryContext;
		result
]

{ #category : #actions }
ACDContextLocator >> locateAnnouncerEntryPoint [
	"Locate the initial context that triggered the delivery of
	a subscription. The initial context is the first that send 
	the message announce:"

	^ self 
		skipAllInternalAnnouncerContexts;
		skipAnnounceContexts;
		result
]

{ #category : #accessing }
ACDContextLocator >> result [

	^ context
]

{ #category : #private }
ACDContextLocator >> sender [

	^ context isNil ifFalse: [ context := context sender ]
]

{ #category : #'filtering actions' }
ACDContextLocator >> skipAllInternalAnnouncerContexts [
	"Filter all contexts until the one that triggered the announcer is found."
	
	self findContextSuchThat: [ :ctxt | 
		(ctxt methodSelector = #announce:) and: [ 
			ctxt methodClass = Announcer ] ]
]

{ #category : #'filtering actions' }
ACDContextLocator >> skipAnnounceContexts [
	
	self findContextSuchThat: [ :ctxt | 
		(ctxt methodSelector = #announce:) and: [ 
			ctxt sender methodSelector ~= #announce: ] ]
]

{ #category : #'filtering actions' }
ACDContextLocator >> skipUntilSubscriptionDeliveryContext [

	self findContextSuchThat: [ :aContext | 
		aContext receiver class = SubscriptionRegistry and: [  
			aContext selector =  #deliver:to:startingAt: and: [ 
				aContext closure isNil ] ] ]
]
