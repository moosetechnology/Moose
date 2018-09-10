"
RTShowEdge is an interaction that add edges on one particular element when the mouse is above the element. Edges are removed when the mouse leaves the element.

=-=-=-=
	| v es |
	v := RTView new.
	es := ((RTEllipse new size: 30) + RTLabel) elementsOn: (1 to: 20).
	v addAll: es.
	RTCircleLayout new initialRadius: 150; on: es.

	es @ (RTShowEdge new connectTo: [ :value | value - 5 to: value + 5]; shape: (RTLine new color: (Color blue alpha: 0.4))).

	^ v
=-=-=-=
"
Class {
	#name : #RTShowEdge,
	#superclass : #RTInteraction,
	#instVars : [
		'connectToElements',
		'shape',
		'receiver'
	],
	#classInstVars : [
		'lastHighlightedElements',
		'lastColor'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #'reset shape' }
RTShowEdge class >> lastHighlightedElements [
	^ lastHighlightedElements
]

{ #category : #'reset shape' }
RTShowEdge class >> lastHighlightedElements: elements [
	lastHighlightedElements := elements
]

{ #category : #visitor }
RTShowEdge >> accept: aVisitor with: args [
	aVisitor visitShowEdgeInteraction: self with: args
]

{ #category : #accessing }
RTShowEdge >> color: aColorOrABlock [
	self shape color: aColorOrABlock
]

{ #category : #public }
RTShowEdge >> connectTo: aBlock [
	"OBSOLETE METHOD"
	self deprecated: 'Use connectToAll:'.
	^ self connectToAll: aBlock
]

{ #category : #public }
RTShowEdge >> connectToAll: aBlock [
	"Establish some connections"
	"aBlock accepts an object and returns a list of objects"
	"aBlock return an object or a list of objects to highlight"
	
	"
	Here is an example on how to use it, using the Mondrian builder:
	-=-=-=-=-=-=-=-=
	| b |
	b := RTMondrian new.
	b interaction showEdge connectToAll: [ :v | Array with: v + 1 ].
	b nodes: #(1 2 2 3).

	b layout circle initialRadius: 10. 
	b
	-=-=-=-=-=-=-=-=

	Another example:
	-=-=-=-=-=-=-=-=
	| b |
	b := RTMondrian new.
	b interaction showEdge color: Color blue trans; connectToAll: #dependentClasses.
	b shape circle.
	b nodes: Collection withAllSubclasses.
	b edges moveBehind; connectFrom: #superclass.
	b normalizer normalizeSize: #numberOfMethods; normalizeColor: #numberOfMethods.
	b layout cluster. 
	b	
	-=-=-=-=-=-=-=-=
	"
	
	connectToElements := [ :el | 
		| objects |
		objects := aBlock rtValue: el model.
		(objects flatCollect: [ :o | el view elementsFromModel: o ]) copyWithout: nil
		]
]

{ #category : #accessing }
RTShowEdge >> connectToElements [
	^ connectToElements
]

{ #category : #public }
RTShowEdge >> connectToElements: aBlock [
	"aBlock accepts a element and returns a list of elements"
	"aBlock return an element or a list of elements to highlight"
	connectToElements := aBlock
]

{ #category : #actions }
RTShowEdge >> doHideEdges: element [
	(element attributes includesKey: #showEdges)
		ifFalse: [ ^ self ].

	(element attributes at: #showEdges) do: [ :el | el view ifNotNil: [ el remove ] ].

	element attributes removeKey: #showEdges
]

{ #category : #actions }
RTShowEdge >> doShowEdges: element [
	| t edges |
	self removeAllAddedEdges.

	t := (connectToElements rtValue: element).
	t := t copyWithout: nil.
	edges := (shape rtValue: element) edgesFrom: (receiver rtValue: element) toAll: t.
	element view addAll: edges.
	element attributes at: #showEdges put: edges.
	self class lastHighlightedElements: edges
]

{ #category : #configuration }
RTShowEdge >> highlightedColor [
	^ self class highlightedColor
]

{ #category : #initialize }
RTShowEdge >> initialize [
	super initialize.
	connectToElements := [ :el | Array with: el ].
	receiver := #yourself.
	self shape: RTLine new
]

{ #category : #hooks }
RTShowEdge >> initializeElement: element [
	element
		when: TRMouseEnter
		do: [ :e | 
			self doShowEdges: element.
			e signalUpdate ].
	element
		when: TRMouseLeave
		do: [ :e | 
			self doHideEdges: element.
			e signalUpdate ]
]

{ #category : #accessing }
RTShowEdge >> receiver [
	^ receiver
]

{ #category : #accessing }
RTShowEdge >> receiver: anElementOrBlock [
	receiver := anElementOrBlock
]

{ #category : #actions }
RTShowEdge >> recordElement: anElement [
	anElement attributes at: #originalColor put: (anElement trachelShape color)

]

{ #category : #actions }
RTShowEdge >> removeAllAddedEdges [
	self class lastHighlightedElements ifNil: [ ^ self ].
	(self class lastHighlightedElements select: [ :edge | edge view notNil ]) 
		do: #remove.
	self class lastHighlightedElements: nil
]

{ #category : #accessing }
RTShowEdge >> shape [
	"Return the line shape"
	^ shape
]

{ #category : #accessing }
RTShowEdge >> shape: aLineShapeOrABlock [
	"Set the line shape used to draw the edges"
	"The argument is rtValued against the element to display"
	shape := aLineShapeOrABlock
]
