Class {
	#name : #RTCellLayoutTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Layouts-Tests'
}

{ #category : #tests }
RTCellLayoutTest >> testBasic [

	| v es |
	v := RTView new.
	es := RTBox elementsOn: (1 to: 20).
	v addAll: es.
	RTCellLayout on: es.
	
	self assert: es sixth position x equals: es first position x
]

{ #category : #tests }
RTCellLayoutTest >> testOnEmpty [

	RTCellLayout on: Array new
]
