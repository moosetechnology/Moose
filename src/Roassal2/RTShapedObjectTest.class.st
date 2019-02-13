Class {
	#name : #RTShapedObjectTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Core-Tests'
}

{ #category : #tests }
RTShapedObjectTest >> testEmittingEvent [

	| el t |
	t := 0.
	el := RTBox element.
	el when: TRMouseEnter do: [ :evt | t := t + 1 ].
	
	self assert: t = 0.
	el announce: TRMouseEnter.
	self assert: t = 1
	
]
