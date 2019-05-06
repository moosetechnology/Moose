Class {
	#name : #RTAbstractHighlightElementsInView,
	#superclass : #RTAbstractInteractionView,
	#instVars : [
		'view'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #initialization }
RTAbstractHighlightElementsInView >> askForPattern [
	^ TRPlatform current
		dialogRequest:
			'Enter a regular expression (leave empty to remove all previous selection)'
		initialAnswer: '*aPattern*'
]

{ #category : #initialization }
RTAbstractHighlightElementsInView >> getRelevantElementsFor: string [
	"Return the list of elements found in the view that matches the string"
	^ view elements select: [ :e | string match: e model printString ]
]

{ #category : #hooks }
RTAbstractHighlightElementsInView >> initializeElement: aView [
	"Subclasses should do a 'super initializeElement: aView'"
	view := aView.
]
