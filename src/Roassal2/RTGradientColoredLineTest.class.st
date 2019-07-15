Class {
	#name : #RTGradientColoredLineTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Core-Tests'
}

{ #category : #tests }
RTGradientColoredLineTest >> testBasic [
	| e1 e2 l |
	e1 := RTElement new.
	e2 := RTElement new.
	l := RTGradientColoredLine edgeFrom: e1 to: e2.
	
]

{ #category : #tests }
RTGradientColoredLineTest >> testBasicWithInitialization [
	| e1 e2 |
	e1 := RTElement new.
	e2 := RTElement new.
	(RTGradientColoredLine new color: (Array with: Color red with: Color blue)) 
		edgeFrom: e1 to: e2.
	
]

{ #category : #tests }
RTGradientColoredLineTest >> testGradientColorShape [
	| e1 e2 shape |
	e1 := RTElement new.
	e2 := RTElement new.
	shape := RTGradientColoredLine new.
	shape gradientColorShape.
	shape edgeFrom: e1 to: e2.
	
]

{ #category : #tests }
RTGradientColoredLineTest >> testGradientColorShape2 [
	| e1 e2 shape |
	e1 := RTElement new.
	e2 := RTElement new.
	e2 translateBy: 5 @ 5.
	shape := RTGradientColoredLine new.
	shape colors: (Array with: Color red with: Color blue).
	shape precision: 100.
	shape gradientColorShape.
	shape edgeFrom: e1 to: e2.
	
]

{ #category : #tests }
RTGradientColoredLineTest >> testPrecision [
	self assert: RTGradientColoredLine new precision equals: 1
]
