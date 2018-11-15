"
A RTHighlightable changes color of elements which should be highlighted.

"
Class {
	#name : #RTHighlightable,
	#superclass : #RTAbstractHighlightable,
	#instVars : [
		'color',
		'edgeColor',
		'getConnectedEdgesBlock',
		'getConnectedElementBlock'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #'reset shape' }
RTHighlightable class >> highlightedColor [
	"Default color for highlighting"
	^ Color blue
]

{ #category : #visitor }
RTHighlightable >> accept: aVisitor with: args [
	aVisitor visitHightlightableInteraction: self with: args.
]

{ #category : #accessing }
RTHighlightable >> color [
	"Return the color used for the highlighting"
	^ color
]

{ #category : #accessing }
RTHighlightable >> color: aColor [
	"Set the color used for the highlighting"
	color := aColor
]

{ #category : #actions }
RTHighlightable >> doHighlightEdge: anEdge [
	"Highlight a particular element."
	"There is duplication of code with #doHighlightElement: Maybe we can avoid this in the future"
	self recordElement: anEdge.
	anEdge trachelShape color: (self highlightEdgeColorFor: anEdge).
	anEdge view ifNotNil: [ anEdge view signalUpdate ].
]

{ #category : #actions }
RTHighlightable >> doHighlightElement: anElement [
	"Highlight a particular element."
	self recordElement: anElement.
	anElement trachelShape color: (self highlightColorFor: anElement).
	anElement view ifNotNil: [ anElement view signalUpdate ].
	
	"Highlight edges if necessary"
	self shouldHighlightEdges ifTrue: [ (getConnectedEdgesBlock rtValue: anElement) do: [ :anEdge | self doHighlightEdge: anEdge ] ]
]

{ #category : #actions }
RTHighlightable >> doUnhighlightElement: anElementOrEdge [
	"Unhighlight a particular element.
	This method also works for edges"
	(anElementOrEdge attributes includesKey: #originalColor)
		ifFalse: [ ^ self ].
	anElementOrEdge trachelShape color: (anElementOrEdge attributes at: #originalColor).
	anElementOrEdge attributes removeKey: #originalColor.
	anElementOrEdge view ifNotNil: [ anElementOrEdge view signalUpdate ].
	
	"Highlight edges if necessary"
	anElementOrEdge isEdge ifTrue: [ ^ self ].
	self shouldHighlightEdges ifTrue: [ (getConnectedEdgesBlock rtValue: anElementOrEdge) do: [ :anEdge | self doUnhighlightElement: anEdge ] ]
]

{ #category : #accessing }
RTHighlightable >> edgeColor [
	"Return a color, or a one-arg block that takes as argument an edge"
	^ edgeColor
]

{ #category : #accessing }
RTHighlightable >> edgeColor: aColorOrOneArgBlock [
	"Argument can either be a color, or a one argument block, which will take the edge as argument when evaluated. In that case, the block should return a color"
	edgeColor := aColorOrOneArgBlock
]

{ #category : #'public - configuration' }
RTHighlightable >> focusOnIncomingElements [
	"Recursively highlights elements reaching out incoming edges"
	getConnectedEdgesBlock := #incomingEdges.
	self getConnectedElementBlock: [ :e | (getConnectedEdgesBlock rtValue: e) collect: #from ].

]

{ #category : #'public - configuration' }
RTHighlightable >> focusOnOutgoingElements [
	"Recursively highlights elements reaching out outgoing edges"
	getConnectedEdgesBlock := #outgoingEdges.
	self getConnectedElementBlock: [ :e | (getConnectedEdgesBlock rtValue: e) collect: #to ].

]

{ #category : #accessing }
RTHighlightable >> getConnectedEdgesBlock [
	^ getConnectedEdgesBlock
]

{ #category : #accessing }
RTHighlightable >> getConnectedEdgesBlock: aOneArgBlockOrSymbol [
	"Indicates how to get edges from a particular element, provided as argument to the block or symbol"
	getConnectedEdgesBlock := aOneArgBlockOrSymbol
]

{ #category : #'public - configuration' }
RTHighlightable >> getConnectedElementBlock [
	"Return the one-arg block that is useful to obtained relevant connected nodes"
	^ getConnectedElementBlock
]

{ #category : #'public - configuration' }
RTHighlightable >> getConnectedElementBlock: aBlockOrSymbol [
	"Set the way connected elements must be obtained. The argument takes one argument, which is the 
	element from which connected element should be considered."
	getConnectedElementBlock := aBlockOrSymbol
]

{ #category : #actions }
RTHighlightable >> getConnectedElementsFrom: anElement [
	"Return the elements to consider while recursing for a given element"
	^ getConnectedElementBlock rtValue: anElement
]

{ #category : #utility }
RTHighlightable >> highlightColorFor: anElement [
	"Return the highlight color"
	^ self highlightedColor rtValue: anElement model
]

{ #category : #actions }
RTHighlightable >> highlightEdgeColorFor: anEdge [
	"Return the highlight color"
	^ edgeColor rtValue: anEdge
]

{ #category : #'public - configuration' }
RTHighlightable >> highlightedColor [
	^ color
]

{ #category : #'public - configuration' }
RTHighlightable >> highlightedColor: aColorOrABlock [
	"Set the Color used to highlight"
	color := aColorOrABlock
]

{ #category : #initialize }
RTHighlightable >> initialize [
	super initialize.
	color := self class highlightedColor.
	
	"Per default, edges should not be highlighted"
	edgeColor := nil.
	self focusOnOutgoingElements.
]

{ #category : #actions }
RTHighlightable >> recordElement: anElement [
	(anElement attributes includesKey: #originalColor) ifTrue: [ ^ self ].
	anElement attributes at: #originalColor put: (anElement trachelShape color)

]

{ #category : #'public - testing' }
RTHighlightable >> shouldHighlightEdges [
	"Return true if edges should be highlighted"
	^ edgeColor notNil
]

{ #category : #'public - testing' }
RTHighlightable >> shouldNotHighlightEdges [
	"Return true if edges should not be highlighted"
	^ self shouldHighlightEdges not
]
