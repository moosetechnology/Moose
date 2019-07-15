"
A class to decorate pushed-back general entities to keep track of the nesting of elements within entity replacements.

Each time a start tag is parsed from the entity's replacement, the count is incremented, and each time an end tag is parsed, it's decremented. If it goes negative, then an end tag terminated an element not started by the entity. When the entity is popped, the count should be zero. (This is more efficient than having the element nester also keep track of which entity replacement an element began in.)
"
Class {
	#name : #XMLPushedBackGeneralEntity,
	#superclass : #XMLPushedBackEntity,
	#instVars : [
		'totalOpenElements'
	],
	#category : #'XML-Parser-Drivers'
}

{ #category : #nesting }
XMLPushedBackGeneralEntity >> endElement [
	totalOpenElements := self totalOpenElements - 1
]

{ #category : #nesting }
XMLPushedBackGeneralEntity >> poppedByTokenizer: aTokenizer [
	totalOpenElements
		ifNotNil: [
			totalOpenElements = 0
				ifFalse: [aTokenizer errorImproperGeneralEntityNesting]]
]

{ #category : #nesting }
XMLPushedBackGeneralEntity >> startElement [
	totalOpenElements := self totalOpenElements + 1
]

{ #category : #accessing }
XMLPushedBackGeneralEntity >> totalOpenElements [
	^ totalOpenElements ifNil: [totalOpenElements := 0]
]
