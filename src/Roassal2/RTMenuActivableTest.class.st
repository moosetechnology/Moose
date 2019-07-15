Class {
	#name : #RTMenuActivableTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Core-Tests'
}

{ #category : #tests }
RTMenuActivableTest >> testHasInteraction [

	| e |
	e := RTElement new.
	self deny: (e hasInteraction: RTMenuActivable).
	e @ RTMenuActivable.
	self assert: (e hasInteraction: RTMenuActivable).
]
