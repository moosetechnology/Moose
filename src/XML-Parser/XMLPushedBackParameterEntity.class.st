"
A class to decorate pushed-back parameter entities to keep track of the nesting of include sections within entity replacements.
"
Class {
	#name : #XMLPushedBackParameterEntity,
	#superclass : #XMLPushedBackEntity,
	#instVars : [
		'totalOpenIncludeSections'
	],
	#category : #'XML-Parser-Drivers'
}

{ #category : #nesting }
XMLPushedBackParameterEntity >> endIncludeSection [
	totalOpenIncludeSections := self totalOpenIncludeSections - 1
]

{ #category : #nesting }
XMLPushedBackParameterEntity >> poppedByTokenizer: aTokenizer [
	totalOpenIncludeSections
		ifNotNil: [
			totalOpenIncludeSections = 0
				ifFalse: [aTokenizer driver handleImproperParameterEntityNesting]]
]

{ #category : #nesting }
XMLPushedBackParameterEntity >> startIncludeSection [
	totalOpenIncludeSections := self totalOpenIncludeSections + 1
]

{ #category : #accessing }
XMLPushedBackParameterEntity >> totalOpenIncludeSections [
	^ totalOpenIncludeSections ifNil: [totalOpenIncludeSections := 0]
]
