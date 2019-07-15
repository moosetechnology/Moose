Class {
	#name : #AthensSVGConverter,
	#superclass : #Object,
	#instVars : [
		'node'
	],
	#category : #'Athens-SVG'
}

{ #category : #'instance creation' }
AthensSVGConverter class >> fromFile: aFileName [
	| doc |
	doc := XMLDOMParser parseFileNamed: aFileName.
	^ self new importXMLDocument: doc
]

{ #category : #'instance creation' }
AthensSVGConverter class >> fromURL: anUrl [
	| doc |
	doc := XMLDOMParser parse: anUrl asZnUrl retrieveContents asString.
	^ self new importXMLDocument: doc
]

{ #category : #'as yet unclassified' }
AthensSVGConverter >> g [
	"group"
	
	node attributes
]

{ #category : #'as yet unclassified' }
AthensSVGConverter >> importXMLDocument: doc [

	| root |
	root := doc nodes elements.
	
	((root size > 1) or: [ root first name ~= 'svg'])  ifTrue: [ self error: 'A root svg element expected' ].

	^ ASVGRoot new translate: root first.

]

{ #category : #'as yet unclassified' }
AthensSVGConverter >> visitNode: aNode [
	| oldNode |
	oldNode := node.
	node := aNode.
	self perform: aNode name asSymbol.

	
]
