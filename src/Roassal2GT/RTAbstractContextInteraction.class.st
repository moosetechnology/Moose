Class {
	#name : #RTAbstractContextInteraction,
	#superclass : #RTInteraction,
	#instVars : [
		'presentation'
	],
	#category : #'Roassal2GT-Glamour-Roassal-Interaction'
}

{ #category : #accessing }
RTAbstractContextInteraction >> presentation [
	^ presentation
]

{ #category : #accessing }
RTAbstractContextInteraction >> presentation: aGLRoassalPresentation [
	presentation := aGLRoassalPresentation
]
