Class {
	#name : #RTDirectLayoutTranslator,
	#superclass : #RTLayoutTranslator,
	#category : #'Roassal2-Layouts'
}

{ #category : #testing }
RTDirectLayoutTranslator class >> isDefault [
	^ true
]

{ #category : #hook }
RTDirectLayoutTranslator >> translate: element to: newPosition [
	element translateTo: newPosition
]
