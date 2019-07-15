Class {
	#name : #RTBezierLineTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Core-Tests'
}

{ #category : #tests }
RTBezierLineTest >> testBasic [

	| v shape  edge els |
	v := RTView new.
	shape := RTEllipse new size: 10; color: (Color purple alpha: 0.3).
	els := (shape elementsOn: (1 to: 4)) @ RTDraggable.
	v addAll: els .
	RTHorizontalLineLayout on: v elements.

	edge := (RTBezierLine new controllingElements: v elements) edgeFrom: els first to: els last.
	v add: edge.
	
	self assert: (els first connectedEdges includes: edge).
	self assert: (els second connectedEdges includes: edge).
	self assert: (els third connectedEdges includes: edge).
	self assert: (els fourth connectedEdges includes: edge).
]

{ #category : #tests }
RTBezierLineTest >> testControllingElementsAndBlock [
	| es shape1 edge1 shape2 edge2 v |
	
	es := RTBox elementsOn: (1 to: 5).
	v := RTView new.
	v addAll: es.
	
	shape1 := RTBezierLine new.
	shape1 controllingElements: [ :edge | 
		Array 
			with: (v elementFromModel: 2)
			with: (v elementFromModel: 3) ].
	edge1 := shape1 edgeFrom: es first to: es fourth.
	
	shape2 := RTBezierLine new.
	shape2 controllingElements: [ :edge | 
		Array 
			with: (v elementFromModel: 3)
			with: (v elementFromModel: 4) ].
	edge2 := shape2 edgeFrom: es first to: es last.

]

{ #category : #tests }
RTBezierLineTest >> testControllingElementsAndBlock02 [
	| es shape1 edge1 shape2 edge2 |
	
	es := RTBox elementsOn: (1 to: 5).
	shape1 := RTBezierLine new.
	shape1 centerOfElements: [ :edge | 
		es copyFrom: edge from model + 1 to: edge to model - 1 ].
	edge1 := shape1 edgeFrom: es first to: es fourth.
	
	shape2 := RTBezierLine new.
	shape2 centerOfElements: [ :edge | 
		es copyFrom: edge from model + 1 to: edge to model - 1 ].
	edge2 := shape2 edgeFrom: es first to: es last.

]

{ #category : #tests }
RTBezierLineTest >> testControllingElementsAndBlock03 [
	| v es shape1 edge1 shape2 edge2 |
	v := RTView new.
	es := RTBox elementsOn: (1 to: 5).
	v addAll: es.

	shape1 := RTBezierLine new.
	shape1 centerOfObjects: #(2 3) inView: v.
	edge1 := shape1 edgeFrom: es first to: es fourth.
	
	shape2 := RTBezierLine new.
	shape1 centerOfObjects: #(3 4) inView: v.
	edge2 := shape2 edgeFrom: es first to: es last.

]

{ #category : #tests }
RTBezierLineTest >> testControllingElementsAndBlock04 [
	| v es shape1 edge1 shape2 edge2 |
	v := RTView new.
	es := (RTEllipse new size: 10; color: (Color blue alpha: 0.4)) elementsOn: (1 to: 5).
	v addAll: es.
	es @ RTDraggable @ RTPopup.

	shape1 := RTBezierLine new.
	shape1 centerOfObjects: [ :f :t | f + 1 to: t -1 ] inView: v.
	edge1 := shape1 edgeFrom: es first to: es fourth.
	
	shape2 := RTBezierLine new.
	shape2 centerOfObjects: [ :f :t | f + 1 to: t -1 ] inView: v.
	edge2 := shape2 edgeFrom: es first to: es last.

	v add: edge1; add: edge2.
	
	RTHorizontalLineLayout on: es.
	
"	v open."
	self assert: edge1 trachelShape  numberOfPoints = 3.
	self assert: edge2 trachelShape  numberOfPoints = 3
]

{ #category : #tests }
RTBezierLineTest >> testFollow [
	| v e bezier startNode endNode edge |
	v := RTView new.
	e := RTBox elementsOn: (Collection withAllSubclasses). 
	v addAll: e.
	bezier := RTBezierLine new 
					color: Color blue;
					follow: #superclass.
	
	startNode := v elementFromModel: OrderedCollection.
	self assert: (bezier getFollowersOf: startNode using: #superclass) size = 3.
	
	endNode := v elementFromModel: Bag.
	edge := bezier edgeFrom: startNode to: endNode.
	self assert: ((bezier getControllingElementsFromFollowFor: edge using: #superclass) collect: #model) asArray = (Array with: SequenceableCollection with: Collection).
]

{ #category : #tests }
RTBezierLineTest >> testFromTo [

	| v e1 e2 e3 l |
	v := RTView new.
	e1 := RTBox element.
	e2 := RTBox element.
	e3 := RTBox element.
	e1 @ RTDraggable.
	e2 @ RTDraggable.
	l := RTBezierLine new controllingElements: (Array with: e3); edgeFrom: e1 to: e2.
	v add: e1; add: e2; add: l.
	
	self assert: l from == e1.
	self assert: l to == e2.
]

{ #category : #tests }
RTBezierLineTest >> testFromToAndControllingElements [

	| e1 e2 l |
	e1 := RTBox element.
	e2 := RTBox element.	
	l := RTBezierLine edgeFrom: e1 to: e2.
	self assert: l shape controllingElements isEmpty
]

{ #category : #'vertical horizontal' }
RTBezierLineTest >> testHorizontal [

	| v shape e1 e2 e |
	v := RTView new.
	shape := RTEllipse new size: 15; color: Color blue trans.
	e1 := shape element.
	e2 := shape element.
	e2 translateBy: 50 @ 25.
	v add: e1; add: e2.
	
	e := RTBezierLine horizontal edgeFrom: e1 to: e2.
	v add: e.
	
]

{ #category : #'vertical horizontal' }
RTBezierLineTest >> testHorizontal02 [

	| v shape e1 e2 e |
	v := RTView new.
	shape := RTEllipse new size: 15; color: Color blue trans.
	e1 := shape element.
	e2 := shape element.
	v add: e1; add: e2.
	
	e := RTBezierLine horizontal edgeFrom: e1 to: e2.
	v add: e.
	
]

{ #category : #tests }
RTBezierLineTest >> testPointsNumber [

	| v e e1 e2 e3 e4 l1 l2 |
	v := RTView new.
	e1 := RTBox element.
	e2 := RTBox element.
	e3 := RTBox element.
	e4 := RTBox element.
	e := Array with: e1 with: e2 with: e3 with: e4.
	e2 translateBy: (100@0).
	e3 translateBy: (200@0).
	e4 translateBy: (300@0).
	l1 := RTBezierLine new controllingElements: (Array with: e3 with: e4); edgeFrom: e1 to: e2. "well defined"
	l2 := RTBezierLine new controllingElements: e; edgeFrom: e1 to: e4. "wrongly defined"
	v add: e1; add: e2; add: l1; add: l2.
	self assert: l1 trachelShape points size = 4.
	self assert: l2 trachelShape points size = 4.
]

{ #category : #'vertical horizontal' }
RTBezierLineTest >> testVertical [

	| v shape e1 e2 e |
	v := RTView new.
	shape := RTEllipse new size: 15; color: Color blue trans.
	e1 := shape element.
	e2 := shape element.
	e2 translateBy: 50 @ 25.
	v add: e1; add: e2.
	
	e := RTBezierLine vertical edgeFrom: e1 to: e2.
	v add: e.
	
]

{ #category : #'vertical horizontal' }
RTBezierLineTest >> testVertical02 [

	| v shape e1 e2 e |
	v := RTView new.
	shape := RTEllipse new size: 15; color: Color blue trans.
	e1 := shape element.
	e2 := shape element.
	v add: e1; add: e2.
	
	e := RTBezierLine horizontal edgeFrom: e1 to: e2.
	v add: e.
	
]
