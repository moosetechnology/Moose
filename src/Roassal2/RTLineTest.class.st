Class {
	#name : #RTLineTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Core-Tests'
}

{ #category : #tests }
RTLineTest >> testBasic [

	| e1 e2 l edge |
	e1 := RTBox elementOn: 5.
	e2 := RTBox elementOn: 10.

	l := RTLine new.
	l widthElement: [ :anEdge | anEdge from model ].	
	edge := l edgeFrom: e1 to: e2.

	self assert: edge trachelShape width equals: 5
]

{ #category : #tests }
RTLineTest >> testBasicError [

	| arrow |
	arrow := RTArrowedLine new
			color: Color red;
			edgeFrom: RTElement new to: RTElement new;
			withOffsetIfMultiple.
	self should: [ arrow element ] raise: Error
]
