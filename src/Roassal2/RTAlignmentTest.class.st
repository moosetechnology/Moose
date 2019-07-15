Class {
	#name : #RTAlignmentTest,
	#superclass : #RTTest,
	#instVars : [
		'align'
	],
	#category : #'Roassal2-Core-Tests'
}

{ #category : #running }
RTAlignmentTest >> setUp [
	super setUp.
	align := RTAlignment new.
]

{ #category : #tests }
RTAlignmentTest >> testFromBottom [
	| es |
	es := (RTBox new size: #yourself) elementsOn: (10 to: 100 by: 10).
	align elements: es.
	RTHorizontalLineLayout on: es.
	es second translateBy: 0 @ 150.
	self assert: (es collect: [ :e | e encompassingRectangle bottom ]) asArray equals: #(10.0 170.0 30.0 40.0 50.0 60.0 70.0 80.0 90.0 100.0).
	self assert: align bottomMostElement equals: es second.
	align bottom.
	self assert: (es collect: [ :e | e encompassingRectangle bottom ]) asArray equals: #(170.0 170.0 170.0 170.0 170.0 170.0 170.0 170.0 170.0 170.0)
	"	
	RTView new addAll: es; yourself.
	"
]

{ #category : #tests }
RTAlignmentTest >> testFromLeft [
	| es |
	es := (RTBox new size: #yourself) elementsOn: (10 to: 100 by: 10).
	align elements: es.
	RTVerticalLineLayout on: es.
	es second translateBy: -150 @ 0.
	self assert: (es collect: [ :e | e encompassingRectangle left ]) asArray equals: #(0.0 -150.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0).
	self assert: align leftMostElement equals: es second.
	align left.
	self assert: (es collect: [ :e | e encompassingRectangle left ]) asArray equals: #(-150.0 -150.0 -150.0 -150.0 -150.0 -150.0 -150.0 -150.0 -150.0 -150.0)
"	
	RTView new addAll: es; inspect.
	"
]

{ #category : #tests }
RTAlignmentTest >> testFromRight [
	| es |
	es := (RTBox new size: #yourself) elementsOn: (10 to: 100 by: 10).
	align elements: es.
	RTVerticalLineLayout on: es.
	es second translateBy: 150 @ 0.
	self assert: (es collect: [ :e | e encompassingRectangle right ]) asArray equals: #(10.0 170.0 30.0 40.0 50.0 60.0 70.0 80.0 90.0 100.0).
	self assert: align rightMostElement equals: es second.
	align right.
	self assert: (es collect: [ :e | e encompassingRectangle right ]) asArray equals: #(170.0 170.0 170.0 170.0 170.0 170.0 170.0 170.0 170.0 170.0)
"	
	RTView new addAll: es; inspect.
	"
]

{ #category : #tests }
RTAlignmentTest >> testFromTop [
	| es |
	es := (RTBox new size: #yourself) elementsOn: (10 to: 100 by: 10).
	align elements: es.
	RTHorizontalLineLayout on: es.
	es second translateBy: 0 @ -50.
	self assert: (es collect: [ :e | e encompassingRectangle top ]) asArray equals: #(0.0 -50.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0).
	self assert: align topMostElement equals: es second.
	align top.
	self assert: (es collect: [ :e | e encompassingRectangle top ]) asArray equals: #(-50.0 -50.0 -50.0 -50.0 -50.0 -50.0 -50.0 -50.0 -50.0 -50.0).
]

{ #category : #tests }
RTAlignmentTest >> testHasElement [
	self deny: align hasElement.
	align elements: (Array with: RTElement new).
	self assert: align hasElement.
	align elements: #().
	self deny: align hasElement.
]

{ #category : #tests }
RTAlignmentTest >> testNoErrorOnDefault [

	RTAlignment new left; right; top; bottom
]
