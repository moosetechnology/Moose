"
A RTBezierLine defines a bezier line shape.

Here is an example
=-=-=-=-=-=-=-=-=
	| v shape  edge els |
	v := RTView new.
	shape := RTEllipse new size: 10; color: (Color purple alpha: 0.3).
	els := (shape elementsOn: (1 to: 6)) @ RTDraggable.
	v addAll: els .
	RTHorizontalLineLayout on: v elements.

	edge := (RTBezierLine new controllingElements: v elements) edgeFrom: els first to: els last.
	v add: edge.

	v open
=-=-=-=-=-=-=-=-=
"
Class {
	#name : #RTBezierLine,
	#superclass : #RTAbstractLine,
	#instVars : [
		'controllingElements',
		'follow',
		'tension'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #public }
RTBezierLine class >> horizontal [
	"Create an horizontal bezier line between the two extremities of the edge"
	"
	e.g.
	v := RTView new.
	shape := RTEllipse new size: 15; color: Color blue trans.
	e1 := shape element.
	e2 := shape element.
	v add: e1; add: e2.
	e1 @ RTDraggable.
	e2 @ RTDraggable.
	e := RTBezierLine horizontal edgeFrom: e1 to: e2.
	v add: e.
	"
	^ self new horizontal
]

{ #category : #public }
RTBezierLine class >> vertical [
	"Create a vertical bezier line between the two extremities of the edge"
	"
	e.g.
	v := RTView new.
	shape := RTEllipse new size: 15; color: Color blue trans.
	e1 := shape element.
	e2 := shape element.
	v add: e1; add: e2.
	e1 @ RTDraggable.
	e2 @ RTDraggable.
	e := RTBezierLine vertical edgeFrom: e1 to: e2.
	v add: e.
	"
	^ self new vertical
]

{ #category : #private }
RTBezierLine >> applyTension: points [
	| n p1 dp p t |
	n := points size - 1.
	p1 := points first.
	dp := points last - p1.
	2 to: n do: [ :i| 
		p := points at: i.
		t := (i-1) / n.
		points at: i put: ((tension * p) + ((1-tension) *(p1+(t * dp) )) ) ].
	
	^ points
]

{ #category : #'control points' }
RTBezierLine >> centerOfElements: aOneArgBlockOrValues [
	"Argument can be a OneArgBlock (taking an edge as argument) or direct values"
	| b |
	b := [ :edge |
		| center intermediaryElement elements |
		elements := aOneArgBlockOrValues rtValue: edge.
		(elements isNil or: [ elements isEmpty ]) 
			ifTrue: [ #() ]
			ifFalse: [ 
				center := (RTGroup withAll: elements) center.
				intermediaryElement := RTBox element.
				intermediaryElement translateTo: center.
				Array with: intermediaryElement ] ].

	self controllingElements:  b
]

{ #category : #'control points' }
RTBezierLine >> centerOfObjects: aOneArgBlockOrValues inView: view [
	"Set one control point, at the center of the elements provided as argument"
	^ self centerOfElements: [ :edge |
		aOneArgBlockOrValues isClosure
			ifTrue:  [ view elementsFromModels: (aOneArgBlockOrValues 
															value: edge from model value: edge to model) ]
			ifFalse: [ view elementsFromModels: aOneArgBlockOrValues ] ]
]

{ #category : #accessing }
RTBezierLine >> controllingElements [
	"Return a list of elements or a one arg block, evaluated against the edge"
	^ controllingElements
]

{ #category : #accessing }
RTBezierLine >> controllingElements: listOfElementsOrOneArgBlock [
	"Argument can be a OneArgBlock (taking an edge as argument) or directly a list of elements"
	"NOTE: controlling elements are retreived when the edge is created, which may not be already added to the view. This means that the argument should not try to access the view from the edge directly"
	controllingElements := listOfElementsOrOneArgBlock
]

{ #category : #accessing }
RTBezierLine >> follow [
	^ follow
]

{ #category : #accessing }
RTBezierLine >> follow: aBlockOrASymbol [
	"Make the bezier follow the path specified as the argument"
	
	follow := aBlockOrASymbol
]

{ #category : #'control points' }
RTBezierLine >> getControllingElementsFromFollowFor: anEdge [
	^ self getControllingElementsFromFollowFor: anEdge using: follow
]

{ #category : #'control points' }
RTBezierLine >> getControllingElementsFromFollowFor: anEdge using: followBlock [
	| start end lca elements block k clean |
	start := anEdge from.
	end := anEdge to.
	lca := self leastCommonAncestor: anEdge using: followBlock.
	elements := OrderedCollection new.
	clean := [ elements ifNotEmpty: [ elements removeFirst ].
		elements ifNotEmpty: [ elements removeLast ]. ].
	lca ifNil: [ 
		elements := (self getFollowersOf: start using: followBlock), 
			(self getFollowersOf: end using: followBlock) reverse allButFirst.
		clean value.
		^ elements.
		 ].
	
	elements add: start.
	block := [ :m | start view elementFromModel: (followBlock rtValue: m)  ].
	
	[ start == lca ] whileFalse: [ 
		start := block value: start model.
		elements add: start.
	 ].
	k := elements size.
	[ end == lca ] whileFalse: [ 
		elements add: end afterIndex: k.
		end := block value: end model.
	 ].
	clean value.
	^ elements.
	
]

{ #category : #'control points' }
RTBezierLine >> getFollowersOf: aNode using: followBlock [
	| answer view t model |
	answer := OrderedCollection new.
	view := aNode view.
	t := aNode.
	[ t notNil ]
		whileTrue: [ 
			answer add: t.
			model := followBlock rtValue: t model.
			model ifNil: [ ^ answer ].
			t := view elementFromModel: model ].
	^ answer
]

{ #category : #'control points' }
RTBezierLine >> getListOfPointsForTrachel: anEdge [
	| listOfPoints realControllingElements |
	listOfPoints := OrderedCollection new.
	
	"We add the first point of the edge"
	listOfPoints add: (attachPoint startingPointOf: anEdge).
	
	"Set the controlling elements from a follow block, if any"
	follow ifNotNil: 
		[ self setControllingElementsFromFollowFor: anEdge ].
	
	realControllingElements := controllingElements rtValue: anEdge.
	realControllingElements ~= #() ifTrue: [ | cElements |
		cElements := realControllingElements collect: [ :o | o isPoint
			ifTrue: [ o ]
			ifFalse: [ o position] ].
		cElements isNotEmpty ifTrue: [ 
			
			(cElements first = anEdge from position and: [ cElements size  > 1 ])
				ifTrue: [ cElements := cElements allButFirst ].
			(cElements last = anEdge to position and: [ cElements size  > 1 ])
				ifTrue: [ cElements := cElements allButLast ] ].
		listOfPoints addAll: cElements
	].

	"We add the last point of the edge"
	listOfPoints add: (attachPoint endingPointOf: anEdge).
	^ self applyTension: listOfPoints
]

{ #category : #'control points' }
RTBezierLine >> horizontal [
	| b center intermediaryElement1 intermediaryElement2 |
	b := [ :edge |
		center := (RTGroup with: edge from with: edge to) center.
		intermediaryElement1 := RTBox element.
		intermediaryElement1 translateTo: (center x @ edge from position y).
		
		intermediaryElement2 := RTBox element.
		intermediaryElement2 translateTo: (center x @ edge to position y).

		Array with: intermediaryElement1 with: intermediaryElement2
	].
	self controllingElements:  b
	

]

{ #category : #initialization }
RTBezierLine >> initialize [
	super initialize.
	tension := 0.7.
	controllingElements := #()
]

{ #category : #'control points' }
RTBezierLine >> leastCommonAncestor: anEdge using: followBlock [
	| a b aNodes bNodes sharedNode |
	a := anEdge from.
	b := anEdge to.
	a = b ifTrue: [ ^ a ].
	aNodes := self getFollowersOf: a using: followBlock.
	bNodes := self getFollowersOf: b using: followBlock.
	sharedNode := nil.
	a := aNodes removeLast.
	b := bNodes removeLast.
	
	[ a == b ] whileTrue: [ 
		sharedNode := a.
		sharedNode ifNil: [ ^ nil ].
		a := aNodes ifEmpty: [ nil ] ifNotEmpty: [aNodes removeLast].
		b := bNodes ifEmpty: [ nil ] ifNotEmpty: [bNodes removeLast]. ].
	^ sharedNode.
]

{ #category : #'control points' }
RTBezierLine >> midPointInCenterOfElements: aOneArgBlockOrValues [
	"Argument can be a OneArgBlock (taking an edge as argument) or direct values"
	| b |
	b := [ :edge |
		| center intermediaryElement elements |
		elements := aOneArgBlockOrValues rtValue: edge.
		(elements isNil or: [ elements isEmpty ]) 
			ifTrue: [ #() ]
			ifFalse: [ 
				center := (RTGroup withAll: elements) center.
				intermediaryElement := RTBox element.
				intermediaryElement translateTo: (edge from position + center) / 2.
				Array with: intermediaryElement ] ].

	self controllingElements:  b
]

{ #category : #'control points' }
RTBezierLine >> midPointInCenterOfObjects: aOneArgBlockOrValues inView: view [
	"Set one control point, between the starting point and the center of all the objects provided as argument"
	^ self midPointInCenterOfElements: [ :edge |
		aOneArgBlockOrValues isClosure
			ifTrue:  [ view elementsFromModels: (aOneArgBlockOrValues 
															value: edge from model value: edge to model) ]
			ifFalse: [ view elementsFromModels: aOneArgBlockOrValues ] ]
]

{ #category : #'control points' }
RTBezierLine >> setControllingElementsFromFollowFor: anEdge [
	controllingElements := self getControllingElementsFromFollowFor: anEdge
]

{ #category : #accessing }
RTBezierLine >> tension [
	^ tension
]

{ #category : #accessing }
RTBezierLine >> tension: aNumber [
	self assert: (aNumber between: 0 and: 1 ).
	tension := aNumber
]

{ #category : #public }
RTBezierLine >> trachelShapeFor: anEdge [
	| trachelShape realControllingElements |
	trachelShape := TRBezierShape new.
	self updateFor: anEdge trachelShape: trachelShape.
"	shape width: (self widthFor: anEdge).
	shape points: (self getListOfPointsForTrachel: anEdge).
	shape strokePaint: (self colorFor: anEdge)."
	realControllingElements := controllingElements rtValue: anEdge. 
	realControllingElements do: [ :e | e addConnectedEdge: anEdge ].
	^ trachelShape
]

{ #category : #rendering }
RTBezierLine >> updateFor: edge trachelShape: trachelShape [
	trachelShape resetPath. 
	trachelShape strokePaint: (self colorFor: edge).
	trachelShape width: (self widthFor: edge).
	trachelShape points: (self getListOfPointsForTrachel: edge).
	trachelShape strokePaint: (self colorFor: edge).

]

{ #category : #'control points' }
RTBezierLine >> vertical [
	| b center intermediaryElement1 intermediaryElement2 |
	b := [ :edge |
		center := (RTGroup with: edge from with: edge to) center.
		intermediaryElement1 := RTBox element.
		intermediaryElement1 translateTo: (edge from position x @ center y).
		
		intermediaryElement2 := RTBox element.
		intermediaryElement2 translateTo: (edge to position x @ center y).

		Array with: intermediaryElement1 with: intermediaryElement2
	].
	self controllingElements:  b
	

]
