Class {
	#name : #RTTreeLayoutTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Layouts-Tests'
}

{ #category : #tests }
RTTreeLayoutTest >> testAddingAttachPoint [
	| v es lineShape l |
	v := RTView new.
	es := RTBox elementsOn: (1 to: 2).
	v addAll: es.
	lineShape := RTLine new.
	l := lineShape edgeFrom: es first to: es second.
	v add: l.
	
	self assert: lineShape attachPoint class equals: RTCenteredAttachPoint.
	RTHorizontalTreeLayout on: es.
	self assert: lineShape attachPoint class equals: RTHorizontalAttachPoint.
]

{ #category : #tests }
RTTreeLayoutTest >> testAddingAttachPointOnVertical [
	| v es lineShape l |
	v := RTView new.
	es := RTBox elementsOn: (1 to: 2).
	v addAll: es.
	lineShape := RTLine new.
	l := lineShape edgeFrom: es first to: es second.
	v add: l.
	
	self assert: lineShape attachPoint class equals: RTCenteredAttachPoint.
	RTTreeLayout on: es.
	self assert: lineShape attachPoint class equals: RTVerticalAttachPoint.
]

{ #category : #tests }
RTTreeLayoutTest >> testAttachPoint [
	| v es edge |
	v := RTView new.
	es := RTBox new size: 10; elementsOn: #(1 2).
	v addAll: es.
	edge := RTLine new color: Color red; edgeFrom: es first to: es second.
	v add: edge.

	RTTreeLayout on: es.

	self assert: edge trachelShape from equals: 10 @ 15.
	self assert: edge trachelShape from ~= es first center.
	
	self assert: edge trachelShape to equals: 10 @ 35.
	self assert: edge trachelShape to ~= es second center.
]

{ #category : #tests }
RTTreeLayoutTest >> testAttachPointAndArrowedLine [
	| v es edge |
	v := RTView new.
	es := RTBox new size: 10; elementsOn: #(1 2).
	v addAll: es.
	edge := RTArrowedLine new color: Color red; edgeFrom: es first to: es second.
	v add: edge.

	RTTreeLayout on: es.

	self assert: edge trachelShape from equals: 10 @ 15.
	self assert: edge trachelShape from ~= es first center.
	
	self assert: edge trachelShape to equals: 10 @ 35.
	self assert: edge trachelShape to ~= es second center.
]

{ #category : #tests }
RTTreeLayoutTest >> testAttachPointAndArrowedLineNo [
	| v es edge |
	v := RTView new.
	es := RTBox new size: 10; elementsOn: #(1 2).
	v addAll: es.
	edge := RTArrowedLine new color: Color red; edgeFrom: es first to: es second.
	v add: edge.

	RTTreeLayout new doNotAttachPoint; on: es.

	self assert: edge trachelShape from equals: es first center.
	self assert: edge trachelShape to equals: es second center
]

{ #category : #tests }
RTTreeLayoutTest >> testAttachPointNo [
	| v es edge |
	v := RTView new.
	es := RTBox new size: 10; elementsOn: #(1 2).
	v addAll: es.
	edge := RTLine new color: Color red; edgeFrom: es first to: es second.
	v add: edge.

	RTTreeLayout new doNotAttachPoint; on: es.

	self assert: edge trachelShape from equals: es first center.
	self assert: edge trachelShape to equals: es second center
]

{ #category : #tests }
RTTreeLayoutTest >> testBasic [
	| layout |
	layout := RTTreeLayout new.
	self assert: layout shouldSetDefaultAttachPoint.
	layout doNotAttachPoint.
	self deny: layout shouldSetDefaultAttachPoint.
]

{ #category : #'tests - reversed' }
RTTreeLayoutTest >> testHorizontallyReversed [
	| layout v edge lineShape elements |
	
	v := RTView new.
	elements := RTBox elementsOn: (1 to: 3).
	v addAll: elements.
	lineShape := RTLine new.
	edge := lineShape edgeFrom: elements first to: elements second.
	v add: edge.
	edge := lineShape edgeFrom: elements first to: elements third.
	v add: edge.
	layout := RTTreeLayout new.
	
	"NO REVERSE"
	layout on: elements.
	self assert: elements second position y > elements first position y.
	self assert: elements second position x < elements first position x.
	self assert: elements second position y equals: elements third position y.
	
	"REVERSE"
	layout horizontallyReverse.
	layout on: elements.
	self assert: elements second position y > elements first position y.
	self assert: elements second position x > elements first position x.
	self assert: elements second position y equals: elements third position y.
	
	"ATTACHPOINT"
	self assert: (v edges noneSatisfy: [ :ed | ed shape attachPoint isInverted ]).
	self assert: (v edges collect: [ :ed | ed shape attachPoint ]) asSet size equals: 1.
]

{ #category : #'tests - reversed' }
RTTreeLayoutTest >> testHorizontallyReversedSetting [
	| l |
	l := RTTreeLayout new.
	self deny: l shouldBeHorizontallyReversed.
	self deny: l shouldBeVerticallyReversed.
	l horizontallyReverse.
	self assert: l shouldBeHorizontallyReversed.
	self deny: l shouldBeVerticallyReversed.
]

{ #category : #tests }
RTTreeLayoutTest >> testNotAddingAttachPoint [
	| v es lineShape l |
	v := RTView new.
	es := RTBox elementsOn: (1 to: 2).
	v addAll: es.
	lineShape := RTLine new.
	l := lineShape edgeFrom: es first to: es second.
	v add: l.

	self assert: lineShape attachPoint class equals: RTCenteredAttachPoint.
	RTHorizontalTreeLayout new
		doNotAttachPoint;
		on: es.
	self assert: lineShape attachPoint class equals: RTCenteredAttachPoint
]

{ #category : #'tests - reversed' }
RTTreeLayoutTest >> testVerticallyReversed [
	| layout v edge lineShape elements |
	
	v := RTView new.
	elements := RTBox elementsOn: (1 to: 3).
	v addAll: elements.
	lineShape := RTLine new.
	edge := lineShape edgeFrom: elements first to: elements second.
	v add: edge.
	edge := lineShape edgeFrom: elements first to: elements third.
	v add: edge.
	layout := RTTreeLayout new.
	
	"NO REVERSE"
	layout on: elements.
	self assert: elements second position y > elements first position y.
	self assert: elements second position x < elements first position x.
	self assert: elements second position y equals: elements third position y.
	
	"REVERSE"
	layout verticallyReverse.
	layout on: elements.
	self assert: elements second position y < elements first position y.
	self assert: elements second position x < elements first position x.
	self assert: elements second position y equals: elements third position y.
	
	"ATTACHPOINT"
	self assert: (v edges collect: [ :ed | ed shape attachPoint ]) asSet size equals: 1.
]

{ #category : #'tests - reversed' }
RTTreeLayoutTest >> testVerticallyReversedAndAttachPoint [
	| es v edge |
	v := RTView new.
	es := RTBox new color: Color blue trans; size: 10; elementsOn: #(1 2).
	v addAll: es.
	edge := RTArrowedLine new color: Color red trans; edgeFrom: es first to: es second.
	v add: edge.
	es @ RTDraggable.
	
	RTTreeLayout new verticallyReverse; on: es.

	self assert: edge trachelShape from equals: es first encompassingRectangle topCenter.
	self assert: edge trachelShape from equals: 10 @ 25.
	self assert: edge trachelShape to equals: es second encompassingRectangle bottomCenter.
	self assert: edge trachelShape to equals: 10 @ 5.
]

{ #category : #'tests - reversed' }
RTTreeLayoutTest >> testVerticallyReversedAndAttachPointNo [
	| es v edge |
	v := RTView new.
	es := RTBox new color: Color blue trans; size: 10; elementsOn: #(1 2).
	v addAll: es.
	edge := RTArrowedLine new color: Color red trans; edgeFrom: es first to: es second.
	v add: edge.
	es @ RTDraggable.
	
	RTTreeLayout new doNotAttachPoint; verticallyReverse; on: es.

	self assert: edge trachelShape from equals: es first center.
	self assert: edge trachelShape from equals: 10 @ 30.
	self assert: edge trachelShape to equals: es second center.
	self assert: edge trachelShape to equals: 10 @ 0.
]

{ #category : #'tests - reversed' }
RTTreeLayoutTest >> testVerticallyReversedAndAttachPointNo02 [
	| es v edge |
	v := RTView new.
	es := RTBox new color: Color blue trans; size: 10; elementsOn: #(1 2).
	v addAll: es.
	edge := RTArrowedLine new color: Color red trans; edgeFrom: es first to: es second.
	v add: edge.
	es @ RTDraggable.
	
	RTTreeLayout new verticallyReverse; doNotAttachPoint; on: es.

	self assert: edge trachelShape from equals: es first center.
	self assert: edge trachelShape from equals: 10 @ 30.
	self assert: edge trachelShape to equals: es second center.
	self assert: edge trachelShape to equals: 10 @ 0.
]

{ #category : #'tests - reversed' }
RTTreeLayoutTest >> testVerticallyReversedSetting [
	| l |
	l := RTTreeLayout new.
	self deny: l shouldBeVerticallyReversed.
	self deny: l shouldBeHorizontallyReversed.
	l verticallyReverse.
	self assert: l shouldBeVerticallyReversed.
	self deny: l shouldBeHorizontallyReversed.
]
