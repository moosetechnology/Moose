"
This is a base class for highlighters that highlight Text objects using XMLHighlights.
"
Class {
	#name : #XMLHighlighter,
	#superclass : #Object,
	#instVars : [
		'highlights',
		'defaultHighlight'
	],
	#category : #'XML-Parser-GTExtensions-Highlighting'
}

{ #category : #accessing }
XMLHighlighter >> defaultColor [
	^ defaultHighlight color
]

{ #category : #accessing }
XMLHighlighter >> defaultColor: aTextColor [
	defaultHighlight color: aTextColor
]

{ #category : #defaults }
XMLHighlighter >> defaults [
	^ self defaultsClass new
]

{ #category : #defaults }
XMLHighlighter >> defaultsClass [
	^ XMLHighlightDefaults
]

{ #category : #private }
XMLHighlighter >> endHighlight: aHighlightOrNil position: aPosition [
	aHighlightOrNil
		ifNotNil: [aHighlightOrNil end: aPosition]
]

{ #category : #highlighting }
XMLHighlighter >> highlightText: aText [
	highlights do: [:each | each applyToText: aText]
]

{ #category : #highlighting }
XMLHighlighter >> highlightText: aText withColor: aTextColor startingAt: aPosition [
	XMLHighlight new
		color: aTextColor;
		start: aPosition;
		applyToText: aText
]

{ #category : #initialization }
XMLHighlighter >> initialize [
	super initialize.

	self
		initializeHighlights;
		initializeColorsWithDefaults: self defaults.
]

{ #category : #initialization }
XMLHighlighter >> initializeColorsWithDefaults: aDefaults [
	self defaultColor: aDefaults defaultColor
]

{ #category : #initialization }
XMLHighlighter >> initializeHighlights [
	defaultHighlight := XMLHighlight new.
	highlights := OrderedCollection with: defaultHighlight.
]

{ #category : #private }
XMLHighlighter >> newHighlightColor: aTextColor position: aPosition [
	^ aTextColor
		ifNotNil: [
			highlights addLast:
				(XMLHighlight new
					color: aTextColor;
					start: aPosition)]
]
