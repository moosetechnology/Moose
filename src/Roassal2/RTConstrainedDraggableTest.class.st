Class {
	#name : #RTConstrainedDraggableTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Core-Tests'
}

{ #category : #tests }
RTConstrainedDraggableTest >> testBasic [

	| v e dragAndConstraint |
	v := RTView new.
	e := RTBox element.
	
	dragAndConstraint := RTConstrainedDraggable new.
	dragAndConstraint rectangle: [ :someElement | 10 @ 10 corner: 200 @ 200 ].
	e @ dragAndConstraint.
	
	self assert: (dragAndConstraint rectangle value: nil) equals: (10 @ 10 corner: 200 @ 200).
	e translateBy: 5 @ 5. 
	
	self assert: (dragAndConstraint transformDistance: 10 forElement: e) equals: 10.
	dragAndConstraint constraintIfNecessary: e.
	
]

{ #category : #tests }
RTConstrainedDraggableTest >> testThinRectangle [

	| e1 e2 i v |
	e1 := (RTBox new size: 20) element.
	e2 := (RTBox new width: 5; height: 20; color: Color blue) element.

	i := RTConstrainedDraggable new.
	i rectangle: [ :e | e1 position corner: e1 position ].
	e2 @ i.
	
	"For debugging"
	v := RTView new.
	v add: e1; add: e2.
	
	
	e2 announce: (TRMouseDragging new step: 50 @ 30).
	self assert: e2 position equals: 0 @ 0.
	
	e2 announce: (TRMouseDragging new step: -50 @ 30).
	self assert: e2 position equals: 0 @ 0.
	
	e2 announce: (TRMouseDragging new step: -50 @ -30).
	self assert: e2 position equals: 0 @ 0.
	
	e2 announce: (TRMouseDragging new step: 50 @ -30).
	self assert: e2 position equals: 0 @ 0.
]

{ #category : #tests }
RTConstrainedDraggableTest >> testWithParent [

	| e1 e2 i v |
	e1 := (RTBox new size: 20) element.
	e2 := (RTBox new size: 5) element.
	e2 parentElement: e1.
	
	i := RTConstrainedDraggable new.
	i withinParent.
	e2 @ i.
	
	"For debugging"
	v := RTView new.
	v add: e1; add: e2.
	
	"No event is being generated, so no restriction"
	e2 translateBy: 50 @ 50.
	self assert: e2 position equals: 50 @ 50.
	
]

{ #category : #tests }
RTConstrainedDraggableTest >> testWithParentWithEvent [

	| e1 e2 i v |
	e1 := (RTBox new size: 20) element.
	e2 := (RTBox new size: 5; color: Color blue) element.
	e2 parentElement: e1.

	i := RTConstrainedDraggable new.
	i withinParent.
	e2 @ i.
	
	"For debugging"
	v := RTView new.
	v add: e1; add: e2.
	
	
	e2 announce: (TRMouseDragging new step: 50 @ 30).
	self assert: (e2 position closeTo: 7.5 @ 7.5).
	
	e2 announce: (TRMouseDragging new step: -50 @ 30).
	self assert: (e2 position closeTo: -7.5 @ 7.5).
	
	e2 announce: (TRMouseDragging new step: -50 @ -30).
	self assert: (e2 position closeTo: -7.5 @ -7.5).
	
	e2 announce: (TRMouseDragging new step: 50 @ -30).
	self assert: (e2 position closeTo: 7.5 @ -7.5).
]

{ #category : #tests }
RTConstrainedDraggableTest >> testWithParentWithEventOfSameSize [

	| e1 e2 i v |
	e1 := (RTBox new size: 20) element.
	e2 := (RTBox new width: 5; height: 20; color: Color blue) element.
	e2 parentElement: e1.

	i := RTConstrainedDraggable new.
	i withinParent.
	e2 @ i.
	
	"For debugging"
	v := RTView new.
	v add: e1; add: e2.
	
	
	e2 announce: (TRMouseDragging new step: 50 @ 30).
	self assert: e2 position equals: 7.5 @ 0.
	
	e2 announce: (TRMouseDragging new step: -50 @ 30).
	self assert: e2 position equals: -7.5 @ 0.
	
	e2 announce: (TRMouseDragging new step: -50 @ -30).
	self assert: e2 position equals: -7.5 @ 0.
	
	e2 announce: (TRMouseDragging new step: 50 @ -30).
	self assert: e2 position equals: 7.5 @ 0.
]
