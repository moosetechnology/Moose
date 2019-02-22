"
A RTRangeBelowXAxisTest is a test class for testing the behavior of RTRangeBelowXAxis
"
Class {
	#name : #RTRangeBelowXAxisTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Builder-Grapher-Decorators-Tests'
}

{ #category : #tests }
RTRangeBelowXAxisTest >> testBasic [

	| r |
	r := RTRangeBelowXAxis new.
	self assert: r startValue equals: 0.
	self assert: r endValue equals: 1.
	self assert: r markerColor equals: r defaultMarkerColor.
]

{ #category : #tests }
RTRangeBelowXAxisTest >> testSimpleExample [

	| b d |
	b := RTGrapher new.
	d := RTData new.
	d points: (1 to: 5).
	d y: #yourself.
	b add: d.
	b addDecorator: (RTRangeBelowXAxis new startValue: 2.5; endValue: 4; label: 'A').
	b addDecorator: (RTRangeBelowXAxis new startValue: 0; endValue: 2; label: 'B').
	b build.
]
