"
This is an interaction for a view
"
Class {
	#name : #RTSelectableElementsContextInteraction,
	#superclass : #RTAbstractContextInteraction,
	#category : #'Roassal2GT-Glamour-Roassal-Interaction'
}

{ #category : #hooks }
RTSelectableElementsContextInteraction >> initializeElement: aView [
	self
		assert: [ self presentation notNil ]
		description: 'The presentation has to be set'.
	self initializeSetOfElements: aView elements
]

{ #category : #hooks }
RTSelectableElementsContextInteraction >> initializeSetOfElements: elements [
 	elements do:
		[ :each | self initializeSingleElement: each ]
]

{ #category : #hooks }
RTSelectableElementsContextInteraction >> initializeSingleElement: each [
	^ each
		when: TRMouseLeftClick
		do:
			[ :event | each model ifNotNil: [ self presentation selection: each model ] ]
]
