"
A RTEventForwarder is used to forward event from one element to other elements
"
Class {
	#name : #RTEventForwarder,
	#superclass : #RTInteraction,
	#instVars : [
		'toObject',
		'eventClass'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #accessing }
RTEventForwarder >> eventClass [
	^ eventClass
]

{ #category : #accessing }
RTEventForwarder >> eventClass: trEventClass [
	"Useful to set the event that has to be forwarded"
	eventClass := trEventClass
]

{ #category : #initialization }
RTEventForwarder >> initialize [
	super initialize.
	eventClass := TREvent. 
	toObject := [ :element | element view ]
]

{ #category : #hooks }
RTEventForwarder >> initializeElement: element [
	element
		when: eventClass
		do: [ :e | 
			(toObject rtValue: element) announce: e ]
]

{ #category : #accessing }
RTEventForwarder >> toObject [
	^ toObject
]

{ #category : #accessing }
RTEventForwarder >> toObject: anObject [
	toObject := anObject
]
