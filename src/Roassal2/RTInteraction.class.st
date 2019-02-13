"
A ROInteraction is xxxxxxxxx.

"
Class {
	#name : #RTInteraction,
	#superclass : #RTObject,
	#category : #'Roassal2-Interactions'
}

{ #category : #public }
RTInteraction class >> initializeElement: element [
	^ self new initializeElement: element; yourself
]

{ #category : #visitor }
RTInteraction >> accept: aVisitor with: args [
	aVisitor visitInteraction: self with: args
]

{ #category : #hooks }
RTInteraction >> initializeElement: element [
	self subclassResponsibility 
]
