"
I model a dynamic variable to keep track of the example that is being processed right now. I am particurly useful to allow after methods to utilize information from this context.
"
Class {
	#name : #GtCurrentExampleContext,
	#superclass : #Notification,
	#category : #'GToolkit-Examples-Runtime'
}

{ #category : #'accessing-defaults' }
GtCurrentExampleContext class >> defaultValue [
	^ nil
]

{ #category : #evaluating }
GtCurrentExampleContext class >> use: anObject during: aBlock [
	^ aBlock 
		on: self 
		do: [ :notification | notification resume: anObject ]
]

{ #category : #evaluating }
GtCurrentExampleContext class >> value [
	^ self signal
]

{ #category : #'accessing-defaults' }
GtCurrentExampleContext >> defaultAction [
	^ self class defaultValue
]
