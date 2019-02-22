"
RTEdge describes an edge between two RTElement. 

Here is an example:
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
v := RTView new.

ballShape := RTEllipse new size: 30; color: #yourself. 

redBall :=  ballShape elementOn: Color red.
blueBall :=  ballShape elementOn: Color blue.
v add: redBall; add: blueBall.
blueBall translateBy: 80 @ 50.

blueBall @ RTDraggable.
redBall @ RTDraggable.

edge := RTLine edgeFrom: redBall to: blueBall.
"" The line above is equivalent to the following two lines:
edge := RTEdge from: redBall to: blueBall.
edge + RTLine.
""
v add: edge.

v
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

"
Class {
	#name : #RTEdge,
	#superclass : #RTShapedObject,
	#instVars : [
		'from',
		'to',
		'shouldBeUsedInLayout'
	],
	#category : #'Roassal2-Core'
}

{ #category : #'DEPRECATED - edge construction' }
RTEdge class >> buildEdgesFromAssociations: associations using: aLineShape inView: view [
	"associations could be {2 -> 5 . 1 -> 5 }.
	 Takes the model of element into account"
	
	| edges associationsOfElements |
	self deprecated: 'Please use RTEdgeBuilder instead'.
	associationsOfElements := associations collect: [ :assoc | (view elementFromModel: assoc key) -> (view elementFromModel: assoc value) ].
	associationsOfElements isEmpty ifTrue: [ ^ #() ].
	
	edges := OrderedCollection new.
	associationsOfElements do: [ :associationOfTwoElements |
				| edge |
				edge := RTEdge from: associationOfTwoElements key to: associationOfTwoElements value. 
				edge + aLineShape.
				edges add: edge ].
	view addAll: edges.
	^ edges

]

{ #category : #'DEPRECATED - edge construction' }
RTEdge class >> buildEdgesFromElements: elements from: fromBlock to: toBlock [
	"Handy method to easily build edges. Return a list of edges"
	"fromBlock and toBlock operates on the model of the elements"

	^ self buildEdgesFromElements: elements from: fromBlock to: toBlock using: RTLine
]

{ #category : #'DEPRECATED - edge construction' }
RTEdge class >> buildEdgesFromElements: elements from: fromBlock to: toBlock in: view [
	"Handy method to easily build edges. Return a list of edges"

	^ self buildEdgesFromElements: elements from: fromBlock to: toBlock using: RTLine in: view
]

{ #category : #'DEPRECATED - edge construction' }
RTEdge class >> buildEdgesFromElements: elements from: fromBlock to: toBlock inView: view [
	"Handy method to easily build edges. Return a list of edges"

	^ self buildEdgesFromElements: elements from: fromBlock to: toBlock using: RTLine inView: view
]

{ #category : #'DEPRECATED - edge construction' }
RTEdge class >> buildEdgesFromElements: elements from: fromBlock to: toBlock using: aLineShape [
	"Handy method to easily build edges. Return a list of edges"
	"fromBlock and toBlock operate on the model of the elements"

	| edges container fromElement toElement elementsWithModels |
	self deprecated: 'Please use RTEdgeBuilder instead'.
	elements isEmpty ifTrue: [ ^ #() ].
	edges := OrderedCollection new.
	elementsWithModels := elements select: [ :el | el model notNil ].
	elementsWithModels do: [ :element |
		container := element parent.
		fromElement := container elementFromModel: (fromBlock rtValue: element model).
		toElement := container elementFromModel: (toBlock rtValue: element model).
		(fromElement notNil and: [ toElement notNil ])
			ifTrue: [  
				| edge |
				edge := RTEdge from: fromElement to: toElement. 
				edge + aLineShape.
				edges add: edge.
				container add: edge ] ].
	^ edges

]

{ #category : #'DEPRECATED - edge construction' }
RTEdge class >> buildEdgesFromElements: elements from: fromBlock to: toBlock using: aLineShape inView: view [
	"Handy method to easily build edges. Return a list of edges"
	"fromBlock and toBlock operate on the model of the elements"
	self deprecated: 'Please use RTEdgeBuilder instead'.
	view addAll: (self buildEdgesFromElements: elements from: fromBlock to: toBlock using: aLineShape)
]

{ #category : #'DEPRECATED - edge construction' }
RTEdge class >> buildEdgesFromElements: elements from: fromBlock toAll: toBlock inView: view [
	"Handy method to easily build edges. Return a list of edges"
	"fromBlock and toBlock operate on the model of the elements"
	"toBlock should return a collection of models"
	self deprecated: 'Please use RTEdgeBuilder instead'.
	^ self buildEdgesFromElements: elements from: fromBlock toAll: toBlock using: RTLine new inView: view
]

{ #category : #'DEPRECATED - edge construction' }
RTEdge class >> buildEdgesFromElements: elements from: fromBlock toAll: toBlock using: aLineShape [
	"Handy method to easily build edges. Return a list of edges"
	"fromBlock and toBlock operate on the model of the elements"
	"toBlock should return a collection of models"

	| edges container fromElement toElements elementsWithModels |
	self deprecated: 'Please use RTEdgeBuilder instead'.
	elements isEmpty ifTrue: [ ^ #() ].
	edges := OrderedCollection new.
	elementsWithModels := elements select: [ :el | el model notNil ].
	
	elementsWithModels do: [ :element |
		container := element view.
		fromElement := container elementFromModel: (fromBlock rtValue: element model).
		
		"We get the list of elements that corresponds to (toBlock roValues: element model)"
		toElements := OrderedCollection new.
		(toBlock rtValue: element model) do: [ :model | 
			| v |
			v := container elementFromModel: model.
			v notNil ifTrue: [ toElements add: v ] ].
		
		
		(fromElement notNil and: [ toElements notEmpty ])
			ifTrue: [  
				toElements do: [ :toElement |
					| edge |
					edge := RTEdge from: fromElement to: toElement. 
					edge + aLineShape.
					edges add: edge.
					container add: edge ] ]  ].
	^ edges

]

{ #category : #'DEPRECATED - edge construction' }
RTEdge class >> buildEdgesFromElements: elements from: fromBlock toAll: toBlock using: aLineShape inView: view [
	"Handy method to easily build edges. Return a list of edges"
	"fromBlock and toBlock operate on the model of the elements"
	"toBlock should return a collection of models"

	| es |
	self deprecated: 'Please use RTEdgeBuilder instead'.
	es := self buildEdgesFromElements: elements from: fromBlock toAll: toBlock using: aLineShape.
	view addAll: es.
	^ es
]

{ #category : #'DEPRECATED - edge construction' }
RTEdge class >> buildEdgesFromObjects: objects from: fromBlock to: toBlock inView: view [
	"Handy method to easily build edges. Return a list of edges"
	"fromBlock and toBlock operate on the model of the elements"
	self deprecated: 'Please use RTEdgeBuilder instead'.
	^ self buildEdgesFromObjects: objects from: fromBlock to: toBlock using: RTLine inView: view
]

{ #category : #'DEPRECATED - edge construction' }
RTEdge class >> buildEdgesFromObjects: objects from: fromBlock to: toBlock inView: view scope: aGroup [
	"Handy method to easily build edges. Return a list of edges"
	"fromBlock and toBlock operate on the model of the elements"
	self deprecated: 'Please use RTEdgeBuilder instead'.
	^ self buildEdgesFromObjects: objects from: fromBlock to: toBlock using: RTLine inView: view scope: aGroup
]

{ #category : #'DEPRECATED - edge construction' }
RTEdge class >> buildEdgesFromObjects: objects from: fromBlock to: toBlock scope: aGroup [
	"Handy method to easily build edges. Return a list of edges"
	"fromBlock and toBlock operate on the model of the elements"
	self deprecated: 'Please use RTEdgeBuilder instead'.
	^ self buildEdgesFromObjects: objects from: fromBlock to: toBlock using: RTLine new scope: aGroup
]

{ #category : #'DEPRECATED - edge construction' }
RTEdge class >> buildEdgesFromObjects: objects from: fromBlock to: toBlock using: aLineShape inView: view [
	"Handy method to easily build edges. Return a list of edges"
	"fromBlock and toBlock operate on the model of the elements"
	self deprecated: 'Please use RTEdgeBuilder instead'.
	^ self buildEdgesFromObjects: objects from: fromBlock to: toBlock using: aLineShape inView: view scope: (RTGroup withAll: view elements)
]

{ #category : #'DEPRECATED - edge construction' }
RTEdge class >> buildEdgesFromObjects: objects from: fromBlock to: toBlock using: aLineShape inView: view scope: aGroup [
	"Handy method to easily build edges. Return a list of edges"
	"fromBlock and toBlock operate on the model of the elements"

	| es |
	self deprecated: 'Please use RTEdgeBuilder instead'.
	es := self buildEdgesFromObjects: objects from: fromBlock to: toBlock using: aLineShape scope: aGroup.
	view addAll: es.
	^ es
]

{ #category : #'DEPRECATED - edge construction' }
RTEdge class >> buildEdgesFromObjects: objects from: fromBlock to: toBlock using: aLineShape scope: aGroup [
	"Handy method to easily build edges. Return a list of edges"
	"fromBlock and toBlock operate on the model of the elements"

	| edges fromElement toElement |
	self deprecated: 'Please use RTEdgeBuilder instead'.
	objects isEmpty ifTrue: [ ^ #() ].
	edges := RTGroup new.
	objects do: [ :object |
		fromElement := aGroup elementFromModel: (fromBlock rtValue: object).
		toElement := aGroup elementFromModel: (toBlock rtValue: object).
		(fromElement notNil and: [ toElement notNil ])
			ifTrue: [  
				| edge |
				edge := RTEdge from: fromElement to: toElement. 
				edge model: object.
				edge + aLineShape.
				edges add: edge ] ].
	^ edges

]

{ #category : #'DEPRECATED - edge construction' }
RTEdge class >> buildEdgesFromObjects: objects from: fromBlock toAll: toAllBlock inView: view [
	self deprecated: 'Please use RTEdgeBuilder instead'.
	^ self buildEdgesFromObjects: objects from: fromBlock toAll: toAllBlock using: RTLine new inView: view scope: (RTGroup withAll: view elements)
]

{ #category : #'DEPRECATED - edge construction' }
RTEdge class >> buildEdgesFromObjects: objects from: fromBlock toAll: toAllBlock scope: aGroup [
	"Handy method to easily build edges. Return a list of edges"
	"fromBlock and toAllBlock operate on the model of the elements"
	self deprecated: 'Please use RTEdgeBuilder instead'.
	^ self buildEdgesFromObjects: objects from: fromBlock toAll: toAllBlock using: RTLine new scope: aGroup
]

{ #category : #'DEPRECATED - edge construction' }
RTEdge class >> buildEdgesFromObjects: objects from: fromBlock toAll: toAllBlock using: aLineShape inView: view [ 
	self deprecated: 'Please use RTEdgeBuilder instead'.
	^ self buildEdgesFromObjects: objects from: fromBlock toAll: toAllBlock using: aLineShape inView: view scope: (RTGroup withAll: view elements)
]

{ #category : #'DEPRECATED - edge construction' }
RTEdge class >> buildEdgesFromObjects: objects from: fromBlock toAll: toAllBlock using: aLineShape inView: view scope: aGroup [
	"Handy method to easily build edges. Return a list of edges"
	"fromBlock and toAllBlock operate on the model of the elements"

	| edges fromElement toElement |
	self deprecated: 'Please use RTEdgeBuilder instead'.
	edges := RTGroup new.
	objects isEmpty ifTrue: [ ^ edges ].
	objects do: [ :object |
		fromElement := aGroup elementFromModel: (fromBlock rtValue: object).
		(toAllBlock rtValue: object) do: [ :toObject |
			toElement := aGroup elementFromModel: toObject.
			(fromElement notNil and: [ toElement notNil ])
				ifTrue: [  
					(fromElement ~~ toElement) ifTrue: 
						[ | edge |
						edge := RTEdge from: fromElement to: toElement. 
						edge + aLineShape.
						edges add: edge.
						view add: edge ] ] ] ].
	^ edges

]

{ #category : #'DEPRECATED - edge construction' }
RTEdge class >> buildEdgesFromObjects: objects from: fromBlock toAll: toAllBlock using: aLineShape scope: aGroup [
	"Handy method to easily build edges. Return a list of edges"
	"fromBlock and toAllBlock operate on the model of the elements"

	| edges fromElement toElement |
	self deprecated: 'Please use RTEdgeBuilder instead'.
	objects isEmpty ifTrue: [ ^ #() ].
	edges := RTGroup new.
	objects do: [ :object |
		fromElement := aGroup elementFromModel: (fromBlock rtValue: object).
		(toAllBlock rtValue: object) do: [ :toObject |
			toElement := aGroup elementFromModel: toObject.
			(fromElement notNil and: [ toElement notNil ])
				ifTrue: [  
					(fromElement ~~ toElement) ifTrue: 
						[ | edge |
						edge := RTEdge from: fromElement to: toElement. 
						edge + aLineShape.
						edges add: edge.
						 ] ] ] ].
	^ edges

]

{ #category : #public }
RTEdge class >> from: fromElement to: toElement [
	"Takes instances of RTElement as arguments"
	^ self 
		on: (Association key: fromElement model value: toElement model)
		from: fromElement 
		to: toElement
]

{ #category : #public }
RTEdge class >> from: fromElement toAll: toElementss [
	"Takes instances of RTElement as first argument and a collection of RTElements as second argument"
	^ RTGroup withAll: (toElementss collect: [ :e | self from: fromElement to: e ])
]

{ #category : #public }
RTEdge class >> on: aModel from: fromElement to: toElement [
	^ (self model: aModel) from: fromElement to: toElement; yourself
]

{ #category : #visitor }
RTEdge >> accept: aVisitor [
	aVisitor visitEdge: self.
]

{ #category : #accessing }
RTEdge >> addedIn: aView [
	view := aView.
	view addEdge: self
]

{ #category : #accessing }
RTEdge >> center [
	^ self encompassingRectangle center.
]

{ #category : #accessing }
RTEdge >> encompassingRectangle [
	"Return the encompassing rectangle of the elements"
	^ Rectangle merging: (Array with: self from encompassingRectangle with: self to encompassingRectangle)
]

{ #category : #accessing }
RTEdge >> from [
	"Return the starting element"
	^ from
]

{ #category : #accessing }
RTEdge >> from: anElement [
	from ifNotNil: [ :element | element removeConnectedEdge: self ].
	from := anElement.
	anElement addConnectedEdge: self
]

{ #category : #accessing }
RTEdge >> from: fromElement to: toElement [
	self from: fromElement.
	self to: toElement
]

{ #category : #accessing }
RTEdge >> height [
	^ self encompassingRectangle height.
]

{ #category : #initialization }
RTEdge >> initialize [
	super initialize.
	shouldBeUsedInLayout := true
]

{ #category : #testing }
RTEdge >> isEdge [
	^ true
]

{ #category : #testing }
RTEdge >> isUsedInLayout [
	"If return true, then it is considered in the layout"
	^ shouldBeUsedInLayout
]

{ #category : #accessing }
RTEdge >> lineSegments [
	^ Array with: (RTLineSegment
		from: (self shape startingPointOf: self)
		to: (self shape endingPointOf: self))
]

{ #category : #actions }
RTEdge >> moveBehind: elements [
	self trachelShape pushBehindAll: (elements collect: [:each | each trachelShape])
]

{ #category : #actions }
RTEdge >> moveBehindItsExtremities [
	"Make the edge be displayed before its extremities are displayed. This is useful to not have the edge over the extremity nodes"
	self trachelShape pushBehindAll: (Array with: self from trachelShape with: self to trachelShape)
]

{ #category : #actions }
RTEdge >> notUseInLayout [
	"Make the edge not used by layout"
	shouldBeUsedInLayout := false
]

{ #category : #actions }
RTEdge >> remove [
	view ifNil: [ self error: 'cannot remove an element that is not part of a view' ].
	to connectedEdges remove: self ifAbsent: [ ].
	from connectedEdges remove: self ifAbsent: [ ].
	view removeEdge: self.
	view := nil
]

{ #category : #accessing }
RTEdge >> to [
	"Return the ending element"
	^ to
]

{ #category : #accessing }
RTEdge >> to: anElement [
	to ifNotNil: [ :element | element removeConnectedEdge: self ].
	to := anElement.
	anElement addConnectedEdge: self
]

{ #category : #actions }
RTEdge >> translateBy: aPoint [
	"do nothing"
]

{ #category : #updating }
RTEdge >> updateFromTo [
	"Update the trachel shape and reset the path. This has the effect of moving the visual widget"
	shape updateFromToFor: self
]
