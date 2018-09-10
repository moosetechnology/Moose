Class {
	#name : #TRCompositeShapeTest,
	#superclass : #TRTest,
	#instVars : [
		'emptyShape',
		'multiShape',
		'box1',
		'box2',
		'canvas'
	],
	#category : #'Trachel-Tests'
}

{ #category : #running }
TRCompositeShapeTest >> setUp [
	super setUp.
	
	emptyShape := TRCompositeShape new.
	multiShape := TRCompositeShape new.
	box1 := TRBoxShape new size: 20. 
	box2 := TRBoxShape new size: 30.
	multiShape addShape: box1; addShape: box2.
	canvas := TRCanvas new.
]

{ #category : #tests }
TRCompositeShapeTest >> testAddingShape [
	emptyShape addShape: TRLabelShape new.
	self assert: emptyShape numberOfShapes equals: 1.
	self assert: multiShape numberOfShapes equals: 2.
]

{ #category : #tests }
TRCompositeShapeTest >> testAlignRight [

	box2 translateBy: 5 @ 5.
	self assert: box1 position equals: (0 @ 0).
	self assert: box2 position equals: (5 @ 5).
	multiShape alignRight.
	self assert: box1 position equals: (0 @ 0).
	self assert: box2 position equals: (0 @ 0).
	multiShape relayout.
	
	"Below is a strange result!"
	self assert: box1 position equals: (10 @ 0).
	self assert: box2 position equals: (15 @ 5).


"TRCanvas new addShape: multiShape ; yourself"
]

{ #category : #tests }
TRCompositeShapeTest >> testAllColor [

	multiShape allColor: Color red.
	self assert: box1 color equals: Color red.
	self assert: box2 color equals: Color red.
	
	self assert: multiShape color equals: Color red

"	emptyShape := TRMultiCompositeShape new.
	multiShape := TRMultiCompositeShape new.
	box1 := TRBoxShape new size: 20. 
	box2 := TRBoxShape new size: 30.
	multiShape addShape: box1; addShape: box2.
	canvas := TRCanvas new."
]

{ #category : #tests }
TRCompositeShapeTest >> testAnnounce [
	| t |
	t := 0.
	box1 when: TREvent do: [ :evt | t := t + 1 ].
	box2 when: TREvent do: [ :evt | t := t + 10 ].
	self assert: t equals: 0.
	multiShape announce: TREvent.
	self assert: t equals: 11.

"	emptyShape := TRMultiCompositeShape new.
	multiShape := TRMultiCompositeShape new.
	box1 := TRBoxShape new size: 20. 
	box2 := TRBoxShape new size: 30.
	multiShape addShape: box1; addShape: box2.
	canvas := TRCanvas new."
]

{ #category : #tests }
TRCompositeShapeTest >> testAnnounce2 [
	| t |
	t := 0.
	multiShape when: TREvent do: [ :evt | t := t + 1 ].
	self assert: t equals: 0.
	multiShape announce: TREvent.
	self assert: t equals: 2.

"	emptyShape := TRMultiCompositeShape new.
	multiShape := TRMultiCompositeShape new.
	box1 := TRBoxShape new size: 20. 
	box2 := TRBoxShape new size: 30.
	multiShape addShape: box1; addShape: box2.
	canvas := TRCanvas new."
]

{ #category : #tests }
TRCompositeShapeTest >> testAnnouncer [
	self should: [ multiShape announcer ] raise: Error
]

{ #category : #tests }
TRCompositeShapeTest >> testBasic [
	emptyShape addShape: TRLabelShape new.
	self assert: emptyShape numberOfShapes equals: 1.
	self assert: emptyShape element equals: nil
]

{ #category : #callbacks }
TRCompositeShapeTest >> testCallbackRemove [
	| t callback |
	t := 0.
	callback := TRRemoveCallback new block: [ :shape | t := t + 1 ].
	multiShape addCallback: callback.
	self assert: t equals: 0.

	multiShape remove.
	self assert: t equals: 0.

	canvas addShape: multiShape.
	multiShape remove.
	self assert: t equals: 1
]

{ #category : #tests }
TRCompositeShapeTest >> testColor [

	multiShape color: Color red.
	self assert: box1 color equals: Color red.
	self assert: box2 color ~= Color red.
	
	self assert: multiShape color equals: Color red

"	emptyShape := TRMultiCompositeShape new.
	multiShape := TRMultiCompositeShape new.
	box1 := TRBoxShape new size: 20. 
	box2 := TRBoxShape new size: 30.
	multiShape addShape: box1; addShape: box2.
	canvas := TRCanvas new."
]

{ #category : #tests }
TRCompositeShapeTest >> testComputePath [

	multiShape computePath

"	emptyShape := TRMultiCompositeShape new.
	multiShape := TRMultiCompositeShape new.
	box1 := TRBoxShape new size: 20. 
	box2 := TRBoxShape new size: 30.
	multiShape addShape: box1; addShape: box2.
	canvas := TRCanvas new."
]

{ #category : #'testing translation' }
TRCompositeShapeTest >> testDefaultPosition [
	self assert: emptyShape position equals: 0 @ 0.
	self assert: multiShape position equals: 0 @ 0.
	self assert: box1 position equals: 0 @ 0.
	self assert: box2 position equals: 0 @ 0.
]

{ #category : #tests }
TRCompositeShapeTest >> testElement [
	emptyShape element: 10.
	self assert: emptyShape element equals: 10.
]

{ #category : #tests }
TRCompositeShapeTest >> testElementOnNonEmpty [
	| c |
	multiShape element: 10.
	self assert: box1 element equals: nil.
	self assert: box2 element equals: nil.
	
	c := TRCanvas new.
	c addShape: multiShape.
	multiShape element: 10.
	self assert: box1 element equals: 10.
	self assert: box2 element equals: 10
]

{ #category : #tests }
TRCompositeShapeTest >> testExtent [

	self assert: box1 extent equals: (20 @ 20).
	self assert: box2 extent equals: (30 @ 30).	
	multiShape extent: 25 @ 25.
	self assert: box1 extent equals: (25 @ 25).
	self assert: box2 extent equals: (25 @ 25).	

]

{ #category : #tests }
TRCompositeShapeTest >> testHeight [
	self assert: multiShape height equals: 30.
	multiShape horizontal.
	TRCanvas new addShape: multiShape.
	self assert: multiShape height equals: 30.
	multiShape vertical.
	TRCanvas new addShape: multiShape.
	self assert: multiShape height equals: 50.

"	emptyShape := TRMultiCompositeShape new.
	multiShape := TRMultiCompositeShape new.
	box1 := TRBoxShape new size: 20. 
	box2 := TRBoxShape new size: 30.
	multiShape addShape: box1; addShape: box2.
	canvas := TRCanvas new."
]

{ #category : #tests }
TRCompositeShapeTest >> testIncludesPoint [

	self assert: (multiShape includesPoint: 5 @ 5).
	self deny: (multiShape includesPoint: -65 @ 5)
]

{ #category : #tests }
TRCompositeShapeTest >> testIsFixed [
	| c |
	c := TRCanvas new.
	c addShape: multiShape.
	self deny: multiShape isFixed.
	
	multiShape setAsFixed.
	self assert: multiShape isFixed.
]

{ #category : #tests }
TRCompositeShapeTest >> testNoCanvas [
	self assert: box1 canvas equals: nil.
	self assert: multiShape canvas equals: nil
]

{ #category : #tests }
TRCompositeShapeTest >> testNoLayout [
	multiShape noLayout
]

{ #category : #tests }
TRCompositeShapeTest >> testNoShapeInEmptyShape [
	self assert: emptyShape numberOfShapes equals: 0
]

{ #category : #tests }
TRCompositeShapeTest >> testOffsets [

	self assert: multiShape offsets asArray equals: (Array with: 0 @ 0 with: 0 @ 0).
	box2 translateBy: 5 @ 6.
	self assert: multiShape offsets asArray  equals: (Array with: 0 @ 0 with: 0 @ 0).
]

{ #category : #tests }
TRCompositeShapeTest >> testOffsets2 [ 
	box2 translateBy: 5 @ 6.
	emptyShape addShape: box1; addShape: box2.
	"Humm.... I do not really understand this. is offset always made of 0@0?"
	self assert: emptyShape offsets asArray equals: (Array with: 0 @ 0 with: 0 @ 0).
]

{ #category : #'testing translation' }
TRCompositeShapeTest >> testPositionWithOffset [

	| s |
	s := TRCompositeShape new.
	s addShape: box1. 
	s addShape: box2 translateBy: 5 @ 4.
	canvas addShape: s.
	
	self assert: box1 position equals: 0 @ 0.
	self assert: box2 position equals: 5 @ 4.

	s translateTo: 10 @ 5.
	self assert: s position equals: 10 @ 5.
	
	self assert: box1 position equals: 5 @ 1.
	self assert: box2 position equals: 10 @ 5


]

{ #category : #'testing translation' }
TRCompositeShapeTest >> testPositionWithOffsetTranslationBy [

	| s |
	s := TRCompositeShape new.
	s addShape: box1. 
	s addShape: box2 translateBy: 5 @ 4.
	canvas addShape: s.
	
	self assert: box1 position equals: 0 @ 0.
	self assert: box2 position equals: 5 @ 4.
	
	s translateBy: 10 @ 5.
	self assert: s position equals: 15 @ 9.
	self assert: box1 position equals:  10 @ 5.
	self assert: box2 position equals:  15 @ 9

]

{ #category : #tests }
TRCompositeShapeTest >> testPushBack [
	| c aShape |
	aShape := TRBoxShape new.

	c := TRCanvas new.
	c addShape: aShape.
	c addShape: multiShape.

	self assert: c numberOfShapes equals: (multiShape numberOfShapes + 1).
	multiShape pushBack.	
	self assert: (c shapes indexOf: aShape) equals: multiShape numberOfShapes + 1.
	self assert: (c shapes indexOf: multiShape shapes first) equals: multiShape numberOfShapes.
	self assert: (c shapes indexOf: multiShape shapes last) equals: 1
]

{ #category : #tests }
TRCompositeShapeTest >> testPushFront [
	| c aShape |
	aShape := TRBoxShape new.

	c := TRCanvas new.
	c addShape: multiShape.
	c addShape: aShape.
	
	self assert: c numberOfShapes equals: (multiShape numberOfShapes + 1).
	multiShape pushFront.	
	self assert: (c shapes indexOf: aShape) equals: 1.
	self assert: (c shapes indexOf: multiShape shapes first) equals: 2.
	self assert: (c shapes indexOf: multiShape shapes last) equals: multiShape numberOfShapes + 1.
]

{ #category : #tests }
TRCompositeShapeTest >> testRemove [
	| c |
	c := TRCanvas new.
	c addShape: multiShape.
	self assert: c numberOfShapes equals: 2.
	multiShape remove.
	self assert: c numberOfShapes equals: 0.

"	emptyShape := TRMultiCompositeShape new.
	multiShape := TRMultiCompositeShape new.
	box1 := TRBoxShape new size: 20. 
	box2 := TRBoxShape new size: 30.
	multiShape addShape: box1; addShape: box2.
	canvas := TRCanvas new."
]

{ #category : #tests }
TRCompositeShapeTest >> testRemovingSubshapes [

	| c s1 s2 s3 s4 |
	c := TRCompositeShape new.
	s1 := TRBoxShape new.
	s2 := TRBoxShape new.
	s3 := TRLabelShape new.
	s4 := TRLabelShape new.
	c addShape: s1; addShape: s2; addShape: s3; addShape: s4.
	
	self assert: c allShapes size equals: 4.
	c removeShapesSuchAs: [ :s | s class == TRLabelShape ].
	self assert: c allShapes size equals: 2.
	self assert: c allShapes asArray equals: (Array with: s1 with: s2)
]

{ #category : #tests }
TRCompositeShapeTest >> testResetPath [
	multiShape resetPath
]

{ #category : #tests }
TRCompositeShapeTest >> testSetCanvas [
	| c |
	c := TRCanvas new.
	multiShape canvas: c.
	self assert: box1 canvas equals: c.
	self assert: multiShape canvas equals: c
]

{ #category : #tests }
TRCompositeShapeTest >> testSignalUpdate [

	multiShape signalUpdate
]

{ #category : #tests }
TRCompositeShapeTest >> testSignalUpdate2 [

	TRCompositeShape new signalUpdate
]

{ #category : #'testing translation' }
TRCompositeShapeTest >> testTranslation [

	multiShape translateTo: 5 @ 6.
	self assert: multiShape position equals: 5 @ 6.
	self assert: box1 position equals: 5 @ 6.
	self assert: box2 position equals: 5 @ 6.
]

{ #category : #'testing translation' }
TRCompositeShapeTest >> testTranslationBy [

	multiShape translateBy: 5 @ 6.
	self assert: multiShape position equals: 5 @ 6.
	self assert: box1 position equals: 5 @ 6.
	self assert: box2 position equals: 5 @ 6.
]

{ #category : #'testing translation' }
TRCompositeShapeTest >> testTranslationBy2 [

	multiShape translateBy: 5 @ 6.
	multiShape translateBy: 5 @ 6.
	self assert: multiShape position equals: 10 @ 12.
	self assert: box1 position equals: 10 @ 12.
	self assert: box2 position equals: 10 @ 12.
]

{ #category : #'testing layout' }
TRCompositeShapeTest >> testVerticalLayout [
	multiShape vertical.
	canvas addShape: multiShape.
	
	self assert: (multiShape offsetOf: box1) equals: 0 @ 0.
	self assert: (multiShape offsetOf: box2) equals: 0 @ 25.

	self assert: box1 position equals: 0 @ 0.
	self assert: box2 position equals: 0 @ 25
	
	

]

{ #category : #tests }
TRCompositeShapeTest >> testVerticalLayoutWithoutAddingToCanvas [
	multiShape vertical.
"	canvas addShape: multiShape."
	
	self assert: (multiShape offsetOf: box1) equals: 0 @ 0.
	self assert: (multiShape offsetOf: box2) equals: 0 @ 25.

	self assert: box1 position equals: 0 @ 0.
	self assert: box2 position equals: 0 @ 0.
	
	

]

{ #category : #tests }
TRCompositeShapeTest >> testWidth [
	self assert: multiShape width equals: 30.
	multiShape resetInnerShapes; vertical.
	TRCanvas new addShape: multiShape.
	self assert: multiShape width equals: 30.

	multiShape resetInnerShapes; horizontal.
	TRCanvas new addShape: multiShape.
	self assert: multiShape width equals: 50.

"	emptyShape := TRMultiCompositeShape new.
	multiShape := TRMultiCompositeShape new.
	box1 := TRBoxShape new size: 20. 
	box2 := TRBoxShape new size: 30.
	multiShape addShape: box1; addShape: box2.
	canvas := TRCanvas new."
]
