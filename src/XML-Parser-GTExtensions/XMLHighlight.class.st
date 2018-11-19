"
This class stores a highlight TextColor and 1-based start/end highlight positions.
"
Class {
	#name : #XMLHighlight,
	#superclass : #Object,
	#instVars : [
		'color',
		'start',
		'end'
	],
	#category : #'XML-Parser-GTExtensions-Highlighting'
}

{ #category : #highlighting }
XMLHighlight >> applyToText: aText [
	| attributeStart attributeEnd |

	"must be bounded between 1 and aText size to avoid errors if the text
	being highlighted was truncated by printString/asString"
	attributeStart := (self start ifNil: [1]) max: 1.
	attributeEnd := (self end ifNil: [aText size]) min: aText size.
	attributeStart <= attributeEnd
		ifTrue: [
			aText
				addAttribute: self color
				from: attributeStart
				to: attributeEnd].
]

{ #category : #accessing }
XMLHighlight >> color [
	^ color
]

{ #category : #accessing }
XMLHighlight >> color: aTextColor [
	color := aTextColor
]

{ #category : #accessing }
XMLHighlight >> end [
	^ end
]

{ #category : #accessing }
XMLHighlight >> end: anEndPosition [
	end := anEndPosition
]

{ #category : #accessing }
XMLHighlight >> start [
	^ start
]

{ #category : #accessing }
XMLHighlight >> start: aStartPosition [
	start := aStartPosition
]
