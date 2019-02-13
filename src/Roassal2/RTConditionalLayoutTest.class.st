"
A RTConditionalLayoutTest is a test class for testing the behavior of RTConditionalLayout
"
Class {
	#name : #RTConditionalLayoutTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Layouts-Tests'
}

{ #category : #tests }
RTConditionalLayoutTest >> testBasic [
	| v es l |
	v := RTView new.
	es := (RTBox new
				color: [ :value | value odd ifTrue: [ Color red ] ifFalse: [ Color blue ] ])
				elementsOn: (1 to: 4).
	v addAll: es.
	
	l := RTConditionalLayout new
				condition: [ :element | element model odd ];
				thenLayout: RTVerticalLineLayout new;
				elseLayout: RTHorizontalLineLayout new.
	l on: es.
	self assert: (es collect: #position) asArray equals: ((Array new: 4) at: 1 put: ((3.0@2.5)); at: 2 put: ((17.5@3.0)); at: 3 put: ((3.0@17.5)); at: 4 put: ((32.5@3.0)); yourself)
]
