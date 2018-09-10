"
A RTGroup represents collections of Roassal elements. A RTGroup is not designed to contain other things than Roassal elements. 
A RTGroup is polymorphic to RTElement. When an RTElement is expected, one can provide an RTGroup.
"
Class {
	#name : #RTGroup,
	#superclass : #OrderedCollection,
	#instVars : [
		'attributes',
		'elementFromModelCache'
	],
	#category : #'Roassal2-Core'
}

{ #category : #public }
RTGroup >> + aShape [
	self addShape: aShape
]

{ #category : #public }
RTGroup >> @ interaction [
	self do: [ :e | e @ interaction ]
]

{ #category : #visitor }
RTGroup >> accept: aRTVisitor [
	self  do: [ :e | e trachelShape accept: aRTVisitor]
]

{ #category : #accessing }
RTGroup >> add: element [
	self resetElementFromModelCache.
	^ super add: element
]

{ #category : #accessing }
RTGroup >> addAll: elements [
	self resetElementFromModelCache.
	^ super addAll: elements
]

{ #category : #public }
RTGroup >> addShape: aShape [
	self do: [ :e | e addShape: aShape ]
]

{ #category : #public }
RTGroup >> addedIn: view [
	self do: [ :e | view add: e ]
]

{ #category : #converting }
RTGroup >> asGroup [
	^ self
]

{ #category : #attributes }
RTGroup >> attributeAt: aKey [
	^ self attributes at: aKey
]

{ #category : #attributes }
RTGroup >> attributeAt: aKey ifAbsent: aBlockClosure [ 
	
	^ self attributes at: aKey ifAbsent: aBlockClosure 
]

{ #category : #attributes }
RTGroup >> attributeAt: aKey ifAbsentPut: aBlockClosure [ 
	
	^ self attributes at: aKey ifAbsentPut: aBlockClosure 
]

{ #category : #attributes }
RTGroup >> attributeAt: aKey put: value [
	^ self attributes at: aKey put: value
]

{ #category : #attributes }
RTGroup >> attributes [
	"Return the list of attributes associated to the element. Attributes are useful for caching values"

	^ attributes ifNil: [ attributes := Dictionary new ]
]

{ #category : #accessing }
RTGroup >> canvas [
	^ self anyOne trachelShape canvas
]

{ #category : #public }
RTGroup >> center [
	"Return the center of the group"
	^ self encompassingRectangle center
]

{ #category : #copying }
RTGroup >> deepCopy [
	"Create a copy of myself, and a copy of each elements and edges."
	
	| copyOfMyself edgesCopy |
	copyOfMyself := self class new.
	self do: [ :anElement |
		copyOfMyself add: (anElement copy resetConnectedEdges; yourself).
	].

	edgesCopy := self flatCollect: #connectedEdges as: Set.
	edgesCopy do: [ :e | 
		| edgeC copyFrom copyTo |
		edgeC := e copy.
		copyFrom := copyOfMyself elementFromModel: e from model.
		copyTo := copyOfMyself elementFromModel: e to model.
		edgeC from: copyFrom.
		edgeC to: copyTo.
		"copyFrom connectedEdges add: edgeC.
		copyTo connectedEdges add: edgeC."
		].

"	anotherCopy := self copy.	
	copyOfMyself with: anotherCopy do: [ :elementCopy :elementOriginal |
		| edges |
		edges := elementOriginal connectedEdges collect: #copy.
		edges do: [ :e | 
			e from: (copyOfMyself detect: [ :ee | ee model = e from model ]).
			e to: (copyOfMyself detect: [ :ee | ee model = e to model ]) ].
		self halt.
		elementCopy resetConnectedEdges.
		elementCopy connectedEdges addAll: edges.
	]."
	^ copyOfMyself
	
]

{ #category : #accessing }
RTGroup >> edges [
	^ self select: [ :o | o class == RTEdge ]
]

{ #category : #accessing }
RTGroup >> elementFromModel: anObject [
	"Return an element that corresponds to the object provided as parameter. If none is found, then return nil"
	
	| t key|
	self elementFromModelCache at: anObject ifPresent: [ :v |
		v isCollection ifFalse: [ ^ v ] ].

	"We have this line because of a bug of the implementation of CompiledMethod>>#="
	t := (anObject class == CompiledMethod) 
				ifTrue: [ self detect: [ :el | el model == anObject ] ifNone: [ nil ] ]
				ifFalse: [ self detect: [ :el | el model = anObject ] ifNone: [ nil ] ].
	"We have this hack for nil objects because in visualWorks a dictionary cannot have nil as a key"
	key := anObject isNil ifTrue: [ 'KeyForNilObjects' ] ifFalse: [ anObject ].
	self elementFromModelCache at: key put: t.
	^ t
]

{ #category : #accessing }
RTGroup >> elementFromModelCache [
	"Define a cache for the element lookup from models"
	elementFromModelCache ifNil: [ elementFromModelCache := Dictionary new ].
	^ elementFromModelCache
]

{ #category : #accessing }
RTGroup >> elements [
	^ self select: [ :o | o class == RTElement ]
]

{ #category : #accessing }
RTGroup >> elementsFromModel: anObject [
	"Return an element that corresponds to the object provided as parameter. If none is found, then return nil"	

	| t key |
	self elementFromModelCache at: anObject ifPresent: [ :v | v isCollection ifTrue: [ ^ v ] ].

	"We have this line because of a bug of the implementation of CompiledMethod>>#="
	t := (anObject class == CompiledMethod) 
				ifTrue: [ self select: [ :el | el model == anObject ] ]
				ifFalse: [ self select: [ :el | el model = anObject ] ].

	"We have this hack for nil objects because in visualWorks a dictionary cannot have nil as a key"
	key := anObject isNil ifTrue: [ 'KeyForNilObjects' ] ifFalse: [ anObject ].
	self elementFromModelCache at: key put: t.
	^ t
]

{ #category : #public }
RTGroup >> elementsFromModels: objects [
	"Return elements that corresponds to the objects provided as parameter. If none is found, then return an empty collection"
	| answer t |
	self assert: [ objects isCollection ] description: 'Provide a set of elements instead of one single element'. 
	answer := RTGroup new.
	objects do: [ :o |
		t := self elementsFromModel: o.
		t notNil ifTrue: [ answer addAll: t ] ].
	^ answer
]

{ #category : #public }
RTGroup >> encompassingRectangle [
	^ self 
		ifEmpty: [ (0 @ 0) corner: (0 @ 0) ]
		ifNotEmpty: [ Rectangle merging: (self collect: #encompassingRectangle) ]
]

{ #category : #public }
RTGroup >> extent [
	^ self encompassingRectangle extent
]

{ #category : #resizing }
RTGroup >> extent: newExtentT [

	| newExtent oldExtent encompassingRectangle |
	newExtent := newExtentT max: 1 @ 1.
	encompassingRectangle := self encompassingRectangle.
	oldExtent := encompassingRectangle extent.
	
	"Make top left to 0 @ 0"
	self translateBy: encompassingRectangle topLeft negated.
	
	"Resizing and moving the position of each element"
	self do: [ :element |
		element translateTo: (element position * newExtent / oldExtent).
		element extent: (element extent * newExtent / oldExtent).
	].
	
	"Move back all the element to the original position"
	self translateBy: encompassingRectangle topLeft.
	
	
	
]

{ #category : #attributes }
RTGroup >> hasAttribute: aKey [ 
	"Return true if attributes includes aKey"
	
	^ attributes notNil and: [ attributes includesKey: aKey ]
]

{ #category : #attributes }
RTGroup >> hasAttributes [ 
	"Return true if at least one attributes is present"
	
	^ attributes notNil and: [ attributes notEmpty ]
]

{ #category : #public }
RTGroup >> height [
	"Return the height of the encompassing rectangle of all the elements"
	^ self encompassingRectangle height
]

{ #category : #resizing }
RTGroup >> height: newHeight [
	self extent: self extent x @ newHeight
]

{ #category : #accessing }
RTGroup >> incomingEdges [
	^ self flatCollect: #incomingEdges
]

{ #category : #public }
RTGroup >> leftMostElement [
	"Return the element located on the most left"
	| t |
	t := self first.
	self do: [ :e | (t position x > e position x) ifTrue: [ t := e ] ].
	^ t
]

{ #category : #accessing }
RTGroup >> model [
	^ 'group'
]

{ #category : #accessing }
RTGroup >> outgoingEdges [
	"Return the list of outgoing edges from that group"
	^ self flatCollect: #outgoingEdges
]

{ #category : #accessing }
RTGroup >> position [
	^ self encompassingRectangle center
]

{ #category : #actions }
RTGroup >> pushBack [
	self do: #pushBack
]

{ #category : #actions }
RTGroup >> pushFront [
	self do: #pushFront
]

{ #category : #public }
RTGroup >> remove [
	"Remove all the elements contained in myself from the view"
	self view removeElements: self
]

{ #category : #attributes }
RTGroup >> removeAttributeAt: aKey [
	^ self attributes removeKey: aKey
]

{ #category : #attributes }
RTGroup >> removeAttributeAt: aKey ifAbsent: anErrorBlock [
	^ self attributes removeKey: aKey ifAbsent: anErrorBlock
]

{ #category : #actions }
RTGroup >> removeInteractionIfPresent: anInteractionClass [
	"Remove an interaction, if present, on each element contained in the group
	
	For example:
	-=-=-=-=-=
	v := RTView new.
	elements := RTEllipse new size: 20; elementsOn: (1 to: 20).
	v addAll: elements.
	RTGridLayout on: elements.

	relevantElements := elements select: [ :e | e model < 10 ].
	relevantElements do: [ :e | e trachelShape color: Color blue ].

	d := RTDraggable new groupToDrag: relevantElements.
	v canvas addMenu: 'add group dragging' callback: [
		relevantElements @ d.
	].

	v canvas addMenu: 'remove group dragging' callback: [
		relevantElements removeInteractionIfPresent: RTDraggable
	].
	v
	-=-=-=-=-=
	"
	self do: [ :e | e removeInteractionIfPresent: anInteractionClass ]
]

{ #category : #rendering }
RTGroup >> renderOn: trachelCanvas [
	"Do nothing"
]

{ #category : #actions }
RTGroup >> resetElementFromModelCache [
	"Reset the cache"
	elementFromModelCache := nil
]

{ #category : #public }
RTGroup >> rightMostElement [
	"Return the element located on the most left"
	| t |
	t := self first.
	self do: [ :e | (t position x < e position x) ifTrue: [ t := e ] ].
	^ t
]

{ #category : #public }
RTGroup >> rotateByDegrees: degreeAsABlockOrValue [
	self do: [ :e | e rotateByDegrees: degreeAsABlockOrValue ]
]

{ #category : #actions }
RTGroup >> setAsFixed [
	self do: #setAsFixed
]

{ #category : #signalling }
RTGroup >> signalUpdate [
	self ifEmpty: [ ^ self ].
	self first signalUpdate.
]

{ #category : #public }
RTGroup >> translateBy: aPoint [
	self do: [ :e | e translateBy: aPoint ]
]

{ #category : #public }
RTGroup >> translateTo: aPosition [
	| center |
	center := self encompassingRectangle center.
	self translateBy: (aPosition - center)
]

{ #category : #public }
RTGroup >> translateTopLeftTo: aPosition [
	| center |
	center := self encompassingRectangle topLeft.
	self translateBy: (aPosition - center)
]

{ #category : #actions }
RTGroup >> updateShape [
	self do: #updateShape
]

{ #category : #accessing }
RTGroup >> view [
	"Return the view of the group. This method assumes that all the elements of group belong to the same view"
	^ self anyOne view
]

{ #category : #public }
RTGroup >> when: evt do: callback [
	self do: [ :e | e when: evt do: callback ]
]

{ #category : #public }
RTGroup >> width [
	^ self encompassingRectangle width
]

{ #category : #resizing }
RTGroup >> width: newWidth [

	self extent: newWidth @ self extent y
]
