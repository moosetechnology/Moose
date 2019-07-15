"
This is an interaction for an element


"
Class {
	#name : #RTSelectableElementContextInteraction,
	#superclass : #RTAbstractContextInteraction,
	#category : #'Roassal2GT-Glamour-Roassal-Interaction'
}

{ #category : #hooks }
RTSelectableElementContextInteraction >> initializeElement: anElement [
	self assert: [ self presentation notNil ] description: 'The presentation has to be set'.
	
	anElement when: TRMouseLeftClick do: [ :event | 
			anElement model ifNotNil: [ self presentation selection: anElement model ] ]
]
