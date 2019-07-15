"
An element is a wrapper to an external provided object (e.g., a number, a file, your object).
To an element, you can add a shape (composed or not), and interaction. Elements are added in a view. 

To be visible, elements must have at least one shape. One key aspect of Roassal is that shapes may accept metrics or numerical values to define their visual dimensions (''e.g.,'' height, width, color, border width). Instead of giving absolute numerical values to define the visual aspect of the graphical element (as with most visualization frameworks), functions used as metrics may be provided.

Instance Variables
	connectedEdges:		<Object>

connectedEdges
	- xxxxx

"
Class {
	#name : #RTElement,
	#superclass : #RTShapedObject,
	#instVars : [
		'connectedEdges',
		'shouldUpdateEdges'
	],
	#category : #'Roassal2-Core'
}

{ #category : #public }
RTElement class >> forCollection: aCollection [ 
	^ (aCollection collect: [ :v | self on: v ]) asArray
]

{ #category : #public }
RTElement class >> on: anObject [

	^ self new model: anObject; yourself
]

{ #category : #visitor }
RTElement >> accept: aVisitor [
	aVisitor visitElement: self
]

{ #category : #accessing }
RTElement >> addCallback: aCallback [
	self trachelShape addCallback: aCallback
]

{ #category : #initialization }
RTElement >> addConnectedEdge: anEdge [
	[ anEdge class == RTEdge ] assert.
	(self connectedEdges includes: anEdge) 
		ifFalse: [ self connectedEdges add: anEdge ]
]

{ #category : #adding }
RTElement >> addedIn: aView [
	view := aView.
	view addElement: self
]

{ #category : #accessing }
RTElement >> center [
	^ self position
]

{ #category : #accessing }
RTElement >> connectedEdges [
	"Return the list of connected egdes (i.e., incoming and outgoing edges)"
	connectedEdges ifNil: [ connectedEdges := RTGroup new ].
	^ connectedEdges
]

{ #category : #accessing }
RTElement >> encompassingRectangle [
	"Return the encompassing rectangle of the element"
	^ trachelShape encompassingRectangle

]

{ #category : #accessing }
RTElement >> extent [
	"Returns a point, describing the extent of the encompassing rectangle of myself"
	^ self encompassingRectangle extent
]

{ #category : #accessing }
RTElement >> extent: aPoint [
	trachelShape extent: aPoint.
	self updateConnectedEdges
]

{ #category : #accessing }
RTElement >> geometry [
	"Return a geometric representation of the shape. A geometric representation is used for computing intersections, overlapping, etc."

	^ self shape geometryFor: self
]

{ #category : #accessing }
RTElement >> height [
	^ trachelShape height
]

{ #category : #accessing }
RTElement >> height: aValue [
	^ trachelShape height: aValue
]

{ #category : #accessing }
RTElement >> incomingEdges [
	"Return the list of incoming edges from the node"
	connectedEdges ifNil: [ ^ #() ].
	^ self connectedEdges select: [ :e | e to == self ]
]

{ #category : #initialization }
RTElement >> initialize [
	super initialize.
	self updateEdgesON
]

{ #category : #testing }
RTElement >> isConnected [
	"Return true if the element is connected to at least one element (which would be itself)"
	"An element is connected if it has at least one incoming or outgoing edge"
	^ self connectedEdges notEmpty
]

{ #category : #testing }
RTElement >> isConnectedTo: anElement [
	"Return true if the current element is connected to anElement"
	connectedEdges ifNil: [ ^ false ].
	^ connectedEdges anySatisfy: [ :edge | (edge from == anElement) or: [ edge to == anElement ] ]
]

{ #category : #testing }
RTElement >> isDirectlyConnectedTo: anElement [
	connectedEdges ifNil: [ ^ false ].
	^ connectedEdges anySatisfy: [ :edge | edge to == anElement ]
]

{ #category : #testing }
RTElement >> isElement [
	^ true
]

{ #category : #testing }
RTElement >> isNotConnected [
	"Return false if the element is connected to at least one element (which would be itself)"
	"An element is connected if it has at least one incoming or outgoing edge"
	^ self isConnected not
]

{ #category : #accessing }
RTElement >> nestedElements [
	"Return the list of elements that I may nest. Return an empty array if none"
	^ (self hasAttribute: #nestedElements)
		ifTrue: [ self attributeAt: #nestedElements ]
		ifFalse: [ #() ]
]

{ #category : #accessing }
RTElement >> outgoingEdges [
	"Return the list of outgoing edges from the node"
	connectedEdges ifNil: [ ^ #() ].
	^ self connectedEdges select: [ :e | e from == self ]
]

{ #category : #accessing }
RTElement >> parentElement [
	"Return the parent element that contains me. Return nil if none.
	This attribute is set by RTNest"
	^ (self hasAttribute: #parentElement)
		ifTrue: [ self attributeAt: #parentElement ]
		ifFalse: [ nil ]
]

{ #category : #accessing }
RTElement >> parentElement: anElement [
	"Keep a reference to the parent element"
	self attributeAt: #parentElement put: anElement
]

{ #category : #accessing }
RTElement >> position [
	^ trachelShape position
	
]

{ #category : #actions }
RTElement >> remove [
	"Remove the element from the view. Edges that may be connected are also removed"
	view ifNil: [ self error: 'cannot remove an element that is not part of a view' ].
	view removeElement: self.
	self removeConnectedEdges.
	view := nil 
]

{ #category : #initialization }
RTElement >> removeConnectedEdge: anEdge [
	[  anEdge class == RTEdge ] assert.
	self connectedEdges remove: anEdge ifAbsent: [ "Some RTDowserBuilderTest tests failed." ]
]

{ #category : #initialization }
RTElement >> removeConnectedEdges [
	"Remove all the edges connected (incoming and outgoing)."
	self connectedEdges copy do: [ :edge | edge remove ]
]

{ #category : #actions }
RTElement >> removeWithItsConnectedEdges [
	view ifNil: [ self error: 'cannot remove an element that is not part of a view' ].
	self connectedEdges copy do: [ :anEdge | anEdge view ifNotNil: [ anEdge remove ] ].
	view removeElement: self.
	view := nil 
]

{ #category : #actions }
RTElement >> removeWithNestedElements [
	"Remove the element from the view. Edges that may be connected are also removed"
	self nestedElements do: #remove.
	self remove. 
	
]

{ #category : #actions }
RTElement >> resetConnectedEdges [
	"Simply make the elements not connected anymore"
	connectedEdges := nil.
]

{ #category : #actions }
RTElement >> rotateByDegrees: degree [
	"Translate the element to a new position. If I am connected to some edges, the edges are also updated."

	trachelShape rotateByDegrees: (degree rtValue: self model).
	
	"No idea what to do with that"
	"self updateConnectedEdges"
]

{ #category : #testing }
RTElement >> shouldUpdateEdges [
	^ shouldUpdateEdges
]

{ #category : #actions }
RTElement >> translateBy: delta [
	"Translate the element by an incremental step. If I am connected to some edges, the edges are also updated."
	"self translateTo: self position + delta"
	trachelShape translateBy: delta.
	self updateConnectedEdges
]

{ #category : #actions }
RTElement >> translateTo: newPosition [
	"Translate the element to a new position. If I am connected to some edges, the edges are also updated."

	trachelShape translateTo: newPosition.
	self updateConnectedEdges
]

{ #category : #accessing }
RTElement >> unbindNestedElements [
	"Unlink the nested elements to myself"
	self removeAttributeAt: #nestedElements ifAbsent: [  ]
]

{ #category : #actions }
RTElement >> updateConnectedEdges [
	shouldUpdateEdges ifFalse: [ ^ self ].
	self connectedEdges do: [ :edge | edge update ]
]

{ #category : #configuration }
RTElement >> updateEdgesOFF [
	shouldUpdateEdges := false
]

{ #category : #configuration }
RTElement >> updateEdgesON [
	shouldUpdateEdges := true
]

{ #category : #accessing }
RTElement >> width [
	"Return the width of an element"
	^ trachelShape width
]

{ #category : #accessing }
RTElement >> width: aValue [
	^ trachelShape width: aValue
]
