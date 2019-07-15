Class {
	#name : #RTHorizontalTreeLayoutTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Layouts-Tests'
}

{ #category : #tests }
RTHorizontalTreeLayoutTest >> testAddingAttachPoint [
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

{ #category : #'tests - reversed' }
RTHorizontalTreeLayoutTest >> testHorizontallyReversed [
	| layout v edge lineShape elements from to |
	
	v := RTView new.
	elements := RTBox elementsOn: (1 to: 3).
	v addAll: elements.
	lineShape := RTLine new.
	edge := lineShape edgeFrom: elements first to: elements second.
	v add: edge.
	edge := lineShape edgeFrom: elements first to: elements third.
	v add: edge.
	layout := RTHorizontalTreeLayout new.
	
	"NO REVERSE"
	layout on: elements.
	self assert: elements second position x > elements first position x.
	self assert: elements second position y < elements first position y.
	self assert: elements second position x equals: elements third position x.
	from := v edges first trachelShape from.
	to := v edges first trachelShape to.
	self assert: from class equals: Point.
	self assert: to class equals: Point.
	
	"REVERSE"
	layout horizontallyReverse.
	layout on: elements.
	self assert: elements second position x < elements first position x.
	self assert: elements second position y < elements first position y.
	self assert: elements second position x equals: elements third position x.
	
	"ATTACHPOINT"
	self assert: (v edges collect: [ :ed | ed shape attachPoint ]) asSet size equals: 1.
	
	"ATTACHPOINT FROM AND TO"
	self assert: (0 @ 7) equals: v edges first trachelShape to.
	self assert: (20 @ 11) equals: v edges first trachelShape from.
	

]

{ #category : #'tests - reversed' }
RTHorizontalTreeLayoutTest >> testHorizontallyReversedSetting [
	| l |
	l := RTHorizontalTreeLayout new.
	self deny: l shouldBeHorizontallyReversed.
	self deny: l shouldBeVerticallyReversed.
	l horizontallyReverse.
	self assert: l shouldBeHorizontallyReversed.
	self deny: l shouldBeVerticallyReversed.
]

{ #category : #'tests - reversed' }
RTHorizontalTreeLayoutTest >> testVerticallyReversed [
	| layout v edge lineShape elements |
	
	v := RTView new.
	elements := RTBox elementsOn: (1 to: 3).
	v addAll: elements.
	lineShape := RTLine new.
	edge := lineShape edgeFrom: elements first to: elements second.
	v add: edge.
	edge := lineShape edgeFrom: elements first to: elements third.
	v add: edge.
	layout := RTHorizontalTreeLayout new.
	self assert: (v edges noneSatisfy: [ :ed | ed shape attachPoint isInverted ]).
	self assert: (v edges collect: [ :ed | ed shape attachPoint ]) asSet size equals: 1.
	
	"NO REVERSE"
	layout on: elements.
	self assert: elements second position x > elements first position x.
	self assert: elements second position y < elements first position y.
	self assert: elements second position x equals: elements third position x.

	self assert: (v edges noneSatisfy: [ :ed | ed shape attachPoint isInverted ]).
	self assert: (v edges collect: [ :ed | ed shape attachPoint ]) asSet size equals: 1.

	"REVERSE"
	layout verticallyReverse.
	layout on: elements.
	self assert: elements second position x > elements first position x.
	self assert: elements second position y > elements first position y.
	self assert: elements second position x equals: elements third position x.
	
	"ATTACHPOINT"
	self assert: (v edges noneSatisfy: [ :ed | ed shape attachPoint isInverted ]).
	self assert: (v edges collect: [ :ed | ed shape attachPoint ]) asSet size equals: 1.
]

{ #category : #'tests - reversed' }
RTHorizontalTreeLayoutTest >> testVerticallyReversedSetting [
	| l |
	l := RTHorizontalTreeLayout new.
	self deny: l shouldBeVerticallyReversed.
	self deny: l shouldBeHorizontallyReversed.
	l verticallyReverse.
	self assert: l shouldBeVerticallyReversed.
	self deny: l shouldBeHorizontallyReversed.
]
