Class {
	#name : #RTInteractiveViewContext,
	#superclass : #RTAbstractViewContext,
	#category : #'Roassal2GT-Glamour-Context'
}

{ #category : #testing }
RTInteractiveViewContext class >> isDefault [
	^ true
]

{ #category : #hooks }
RTInteractiveViewContext >> interactionsToBeRegistered [
	^ Array with: RTSelectableElementsContextInteraction with: RTResizeableViewContextInteraction
]
