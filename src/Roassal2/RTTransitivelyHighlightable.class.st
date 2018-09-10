"
A RTTransitivelyHighlightable highlight all connected elements (either incoming or outgoing). Consider the following example:

	v := RTView new.
	v addAll: (RTBox elementsOn: (1 to: 3)).
	RTGridLayout on: v elements.
	
	eb := RTEdgeBuilder new.
	eb view: v.
	eb useAssociations: { 1 -> 2 . 2 -> 3 }.
	
	v elements @ RTPopup @ (RTTransitivelyHighlightable new focusOnIncomingElements; color: Color red).
	v
"
Class {
	#name : #RTTransitivelyHighlightable,
	#superclass : #RTHighlightable,
	#instVars : [
		'getConnectedElementBlock',
		'edgeColor',
		'getConnectedEdgesBlock'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #actions }
RTTransitivelyHighlightable >> doHighlightEdge: anEdge [
	"Highlight a particular element."
	"There is duplication of code with #doHighlightElement: Maybe we can avoid this in the future"
	self recordElement: anEdge.
	anEdge trachelShape color: (self highlightEdgeColorFor: anEdge).
	anEdge view ifNotNil: [ anEdge view signalUpdate ].
]

{ #category : #actions }
RTTransitivelyHighlightable >> doHighlightElement: anElement [
	super doHighlightElement: anElement.
	"Highlight edges if necessary"
	self shouldHighlightEdges ifTrue: [ (getConnectedEdgesBlock rtValue: anElement) do: [ :anEdge | self doHighlightEdge: anEdge ] ]
]

{ #category : #actions }
RTTransitivelyHighlightable >> doUnhighlightElement: anElement [
	super doUnhighlightElement: anElement.
	"Highlight edges if necessary"
	self shouldHighlightEdges ifTrue: [ (getConnectedEdgesBlock rtValue: anElement) do: [ :anEdge | super doUnhighlightElement: anEdge ] ]
]

{ #category : #accessing }
RTTransitivelyHighlightable >> edgeColor [
	"Return a color, or a one-arg block that takes as argument an edge"
	^ edgeColor
]

{ #category : #accessing }
RTTransitivelyHighlightable >> edgeColor: aColorOrOneArgBlock [
	"Argument can either be a color, or a one argument block, which will take the edge as argument when evaluated. In that case, the block should return a color"
	edgeColor := aColorOrOneArgBlock
]

{ #category : #'public - configuration' }
RTTransitivelyHighlightable >> focusOnIncomingElements [
	"Recursively highlights elements reaching out incoming edges"
	getConnectedEdgesBlock := #incomingEdges.
	self getConnectedElementBlock: [ :e | (getConnectedEdgesBlock rtValue: e) collect: #from ].

]

{ #category : #'public - configuration' }
RTTransitivelyHighlightable >> focusOnOutgoingElements [
	"Recursively highlights elements reaching out outgoing edges"
	getConnectedEdgesBlock := #outgoingEdges.
	self getConnectedElementBlock: [ :e | (getConnectedEdgesBlock rtValue: e) collect: #to ].

]

{ #category : #accessing }
RTTransitivelyHighlightable >> getConnectedElementBlock [
	"Return the one-arg block that is useful to obtained relevant connected nodes"
	^ getConnectedElementBlock
]

{ #category : #accessing }
RTTransitivelyHighlightable >> getConnectedElementBlock: aBlockOrSymbol [
	"Set the way connected elements must be obtained "
	getConnectedElementBlock := aBlockOrSymbol
]

{ #category : #actions }
RTTransitivelyHighlightable >> getConnectedElementsFrom: anElement [
	"Return the elements to consider while recursing for a given element"
	^ getConnectedElementBlock rtValue: anElement
]

{ #category : #actions }
RTTransitivelyHighlightable >> getRelevantElementsFrom: someElements [
	"Return the transively closure of connected elements."
	| set |
	set := Set new.
	someElements do: [ :e | self getRelevantElementsFromSingle: e in: set ].
	^ set
]

{ #category : #actions }
RTTransitivelyHighlightable >> getRelevantElementsFromSingle: anElement in: set [
	"Private method"
	(set includes: anElement)
		ifTrue: [ ^ self ].
	set add: anElement.
	(self getConnectedElementsFrom: anElement)
		do: [ :e | self getRelevantElementsFromSingle: e in: set ]
]

{ #category : #actions }
RTTransitivelyHighlightable >> highlightEdgeColorFor: anEdge [
	"Return the highlight color"
	^ edgeColor rtValue: anEdge
]

{ #category : #initialization }
RTTransitivelyHighlightable >> initialize [
	super initialize.
	self focusOnOutgoingElements.
	
	"Per default, edges should not be highlighted"
	edgeColor := nil
]

{ #category : #'public - testing' }
RTTransitivelyHighlightable >> shouldHighlightEdges [
	"Return true if edges should be highlighted"
	^ edgeColor notNil
]

{ #category : #'public - testing' }
RTTransitivelyHighlightable >> shouldNotHighlightEdges [
	"Return true if edges should not be highlighted"
	^ self shouldHighlightEdges not
]
