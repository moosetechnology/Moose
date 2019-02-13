"
A DCRTAbstractLineDecorationTest is a test class for testing the behavior of DCRTAbstractLineDecoration
"
Class {
	#name : #RTAbstractLineDecorationTest,
	#superclass : #RTTest,
	#instVars : [
		'from',
		'to'
	],
	#category : #'Roassal2-LineDecorations'
}

{ #category : #running }
RTAbstractLineDecorationTest >> setUp [
	super setUp.
	(from := RTBox element) translateTo: 0 @ 0.
	(to := RTBox element) translateTo: 100 @ 0
]

{ #category : #tests }
RTAbstractLineDecorationTest >> testCustomFromPoint [
	| head line edge trachelShape |
	head := RTLineHead shape: RTSimpleArrow.
	line := RTArrowedLine new head: head.
	edge := line edgeFrom: from to: to.
	trachelShape := head trachelShapeFor: edge from: 200 @ 0.
	self assert: (trachelShape from onLineFrom: 105 @ 0 to: 205 @ 0).
	to translateTo: 0 @ -100.
	head updateFor: edge trachelShape: trachelShape from: 0 @ -200.
	self assert: (trachelShape from onLineFrom: 0 @ -105 to: 0 @ -205)
]

{ #category : #tests }
RTAbstractLineDecorationTest >> testHead [
	| head line edge trachelShape |
	head := RTLineHead shape: RTSimpleArrow.
	line := RTArrowedLine new head: head.
	edge := line edgeFrom: from to: to.
	trachelShape := head trachelShapeFor: edge.
	self assert: trachelShape to = (100 @ 0).
	to translateTo: 0 @ -100.
	head updateFor: edge trachelShape: trachelShape.
	self assert: trachelShape to = (0 @ -100)
]

{ #category : #tests }
RTAbstractLineDecorationTest >> testShapeHandling [
	| head |
	head := RTLineHead shape: RTEmptyArrow.
	self assert: head trachelShapeClass = TREmptyArrowHeadShape
]

{ #category : #tests }
RTAbstractLineDecorationTest >> testTail [
	| tail line edge trachelShape |
	tail := RTLineTail shape: RTSimpleArrow.
	line := RTArrowedLine new head: tail.
	edge := line edgeFrom: from to: to.
	trachelShape := tail trachelShapeFor: edge.
	self assert: trachelShape to = (0 @ 0).
	from translateTo: 100 @ -100.
	tail updateFor: edge trachelShape: trachelShape.
	self assert: trachelShape to = (100 @ -100)
]
