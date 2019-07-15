"
I am a special view used to record registered announcement to propagate them outside of the view to other Spec models
"
Class {
	#name : #RTViewForSpec,
	#superclass : #RTView,
	#instVars : [
		'lastEvent'
	],
	#category : #'Roassal2Spec-Core'
}

{ #category : #adding }
RTViewForSpec >> addElement: anElement [

	super addElement: anElement.
	
	anElement announcer subscriptions 
		subscriptionsDo: [ :reg | 
			anElement 
				when: reg announcementClass
				do: [ :ann | lastEvent value: ann ] ]
]

{ #category : #initialization }
RTViewForSpec >> initialize [

	super initialize.

	lastEvent := nil asValueHolder.
]

{ #category : #accessing }
RTViewForSpec >> lastEvent [
	^ lastEvent value
]

{ #category : #accessing }
RTViewForSpec >> lastEvent: anObject [
	lastEvent value: anObject
]

{ #category : #protocol }
RTViewForSpec >> lastEventSubscriptionsDo: aBlock [

	lastEvent announcer subscriptions subscriptionsDo: aBlock
]

{ #category : #'protocol-events' }
RTViewForSpec >> whenLastEventChangedDo: aBlock [

	lastEvent whenChangedDo: aBlock
]
