Class {
	#name : #RTMultiLineTest,
	#superclass : #RTTest,
	#instVars : [
		'e1',
		'e2',
		'v'
	],
	#category : #'Roassal2-Core-Tests'
}

{ #category : #running }
RTMultiLineTest >> setUp [
	super setUp.
	e1 := RTBox element.
	e2 := RTBox element.
	v := RTView new
]

{ #category : #tests }
RTMultiLineTest >> testAddedInCanvas [

	| es shape edge |
	v := RTView new.
	es := RTBox new elementsOn: (1 to: 2).
	es second translateBy: 30 @ 30.
	es @ RTDraggable.
	v addAll: es.
	shape := RTMultiLine new orthoHorizontal.
	edge := shape edgeFrom: es first to: es second.
	v add: edge.

	self assert: v canvas numberOfShapes equals: 5.
	edge pushBack.
	self assert: v canvas numberOfShapes equals: 5.

	edge trachelShape pushFront.
	self assert: v canvas numberOfShapes equals: 5.

	v canvas push: edge trachelShape behind: es first trachelShape.
	self assert: v canvas numberOfShapes equals: 5.

]

{ #category : #tests }
RTMultiLineTest >> testHorizontalOrthogonal [
	"The default is a straight line"
	| lineShape edge |
	lineShape := RTMultiLine new.
	lineShape orthoHorizontal.
	edge := lineShape edgeFrom: e1 to: e2.
	v add: edge.
	self assert: v canvas numberOfShapes equals: 3
]

{ #category : #tests }
RTMultiLineTest >> testOrthoVerticalLine [

	| eb |
	v addAll: (RTBox elementsOn: Collection withAllSubclasses).

	eb := RTEdgeBuilder new.
	eb shape orthoVerticalLine.
	eb view: v.
	eb	objects: Collection withAllSubclasses;
		connectFrom: #superclass to: #yourself.

	RTTreeLayout on: v elements.
	v
]

{ #category : #tests }
RTMultiLineTest >> testStraight [
	"The default is a straight line"
	| lineShape edge |
	lineShape := RTMultiLine new.
	edge := lineShape edgeFrom: e1 to: e2.
	v add: edge.
	self assert: v canvas numberOfShapes equals: 1
]

{ #category : #tests }
RTMultiLineTest >> testVerticalOrthogonal [
	"The default is a straight line"
	| lineShape edge |
	lineShape := RTMultiLine new.
	lineShape orthoVertical.
	edge := lineShape edgeFrom: e1 to: e2.
	v add: edge.
	self assert: v canvas numberOfShapes equals: 3
]
