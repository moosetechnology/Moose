"
A RTSunburstBuilderTest is a test class for testing the behavior of RTSunburstBuilder
"
Class {
	#name : #RTSunburstBuilderTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Tests'
}

{ #category : #tests }
RTSunburstBuilderTest >> testBasic [
	| b |
	b := RTSunburstBuilder new.
	self assert: b layout layout class equals: RTSunburstConstantWidthLayout.
	self assert: b shape current class equals: RTArc.
	self assert: b elements isCollection.
]
