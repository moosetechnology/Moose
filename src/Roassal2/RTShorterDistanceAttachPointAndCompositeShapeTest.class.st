Class {
	#name : #RTShorterDistanceAttachPointAndCompositeShapeTest,
	#superclass : #RTTest,
	#category : #'Roassal2-AttachPoint-Tests'
}

{ #category : #tests }
RTShorterDistanceAttachPointAndCompositeShapeTest >> testBasic [

	| v shape es |
	v := RTView new.
	v @ RTDraggableView.
	shape := RTCompositeShape new.
	shape add: RTLabel new.
	shape add: RTBox new.
	es := shape elementsOn: RTShape withAllSubclasses.
	v addAll: es.
	RTEdgeBuilder new
		view: v;
		objects: RTShape withAllSubclasses;
		shape:
			(RTArrowedLine new
				color: Color black;
				attachPoint:
					(RTShorterDistanceAttachPointAndCompositeShape new
						composedShapeSelection: #second));
		connectFrom: #superclass to: #yourself.
	RTNest new
		for: es
		inShape: #second
		add:
			[ :group :model | 
			group
				addAll:
					((RTBox new color: Color blue) elementsOn: model rtmethods).
			RTGridLayout on: group ].
	RTHorizontalTreeLayout on: es.
	es @ RTPopup @ RTDraggable.

]

{ #category : #tests }
RTShorterDistanceAttachPointAndCompositeShapeTest >> testBasic02 [

	| attachPoint s1 s2 e1 e2 v |
	attachPoint := RTShorterDistanceAttachPointAndCompositeShape new
							composedShapeSelection: #second.
	
	s1 := RTBox new color: Color red.
	s2 := RTCompositeShape
        with: (RTBox new color: Color green)
        with: (RTBox new color: Color blue).
	s2 horizontal.
	e1 := s1 elementOn: #atomic.
	e2 := s2 elementOn: #composite.					
	
	v := RTView new.
	v add: e1; add: e2.
	
	self deny: (attachPoint hasCompositeShape: e1).
	self assert: (attachPoint hasCompositeShape: e2).
	
	self assert: (attachPoint trachelShapeToBeConsideredOf: e1) color equals: Color red.
	self assert: (attachPoint trachelShapeToBeConsideredOf: e2) color equals: Color blue.
	self assert: (attachPoint getEncompassingRectangleOf: e1) ~= (attachPoint getEncompassingRectangleOf: e2)
]

{ #category : #tests }
RTShorterDistanceAttachPointAndCompositeShapeTest >> testBasic03 [

	| attachPoint s1 s2 e1 e2 v |
	attachPoint := RTShorterDistanceAttachPointAndCompositeShape new
							composedShapeSelection: #first.
	
	s1 := RTBox new color: Color red.
	s2 := RTCompositeShape
        with: (RTBox new size: 20; color: Color green)
        with: (RTBox new color: Color blue).
	s2 horizontal.
	e1 := s1 elementOn: #atomic.
	e2 := s2 elementOn: #composite.					
	
	v := RTView new.
	v add: e1; add: e2.
	
	e2 translateTo: 20 @ 20.
	
	self deny: (attachPoint hasCompositeShape: e1).
	self assert: (attachPoint hasCompositeShape: e2).
	
	self assert: (attachPoint trachelShapeToBeConsideredOf: e1) color equals: Color red.
	self assert: (attachPoint trachelShapeToBeConsideredOf: e2) color equals: Color green.
	self assert: (attachPoint getEncompassingRectangleOf: e1) ~= (attachPoint getEncompassingRectangleOf: e2).
	
]

{ #category : #tests }
RTShorterDistanceAttachPointAndCompositeShapeTest >> testIfExtremityIsNotComposite [

	| v s1 s2 e1 e2 attachPoint e |
	v := RTView new.
	s1 := RTBox new color: Color red.
	s2 := RTCompositeShape
	        with: (RTBox new color: Color green)
	        with: (RTBox new color: Color blue).
	s2 horizontal.
	e1 := s1 elementOn: #atomic.
	e2 := s2 elementOn: #composite.

	e1 @ RTDraggable.
	e2 @ RTDraggable.

	attachPoint := RTShorterDistanceAttachPointAndCompositeShape new
							composedShapeSelection: #first.
	e := RTLine new attachPoint: attachPoint; edgeFrom: e1 to: e2.
	v add: e1; add: e2; add: e.
	RTTreeLayout new on: v elements.
	
]
