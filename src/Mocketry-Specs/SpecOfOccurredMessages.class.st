"
I am base class for different kind of specifications for occurred message sends
"
Class {
	#name : #SpecOfOccurredMessages,
	#superclass : #SpecOfObjectState,
	#category : 'Mocketry-Specs'
}

{ #category : #converting }
SpecOfOccurredMessages >> asInteractionSpecBetweenAll: expectedReceivers [
	self subclassResponsibility 
]

{ #category : #accessing }
SpecOfOccurredMessages >> populateObjectsInteractionSpec: anObjectsInteractionSpec [
	self subclassResponsibility 
]
