Class {
	#name : #RTMockElement,
	#superclass : #RTObject,
	#instVars : [
		'realElement',
		'position'
	],
	#category : #'Roassal2-Layouts'
}

{ #category : #action }
RTMockElement >> applyToRealElement [
	realElement translateTo: position
]

{ #category : #'as yet unclassified' }
RTMockElement >> extent [
	^ realElement extent
]

{ #category : #'as yet unclassified' }
RTMockElement >> height [
	^ realElement height
]

{ #category : #accessing }
RTMockElement >> position [
	^ position
]

{ #category : #accessing }
RTMockElement >> realElement [
	^ realElement
]

{ #category : #accessing }
RTMockElement >> realElement: rtElement [
	realElement := rtElement.
	position := rtElement position
]

{ #category : #actions }
RTMockElement >> translateTo: aPosition [
	position := aPosition
]

{ #category : #'as yet unclassified' }
RTMockElement >> view [
	^ realElement view
]

{ #category : #'as yet unclassified' }
RTMockElement >> width [
	^ realElement width
]
