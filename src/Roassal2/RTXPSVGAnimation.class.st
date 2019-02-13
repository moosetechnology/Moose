"
I am a simple animation for the example stacks examples in RTExperimentalExample
"
Class {
	#name : #RTXPSVGAnimation,
	#superclass : #RTAnimation,
	#instVars : [
		'curves0',
		'curves1',
		'animatedValue'
	],
	#category : #'Roassal2-Experimental'
}

{ #category : #public }
RTXPSVGAnimation >> curvesFor: index [
	| t res acurves bcurves c2 |
	t := animatedValue value.
	acurves := curves0 at: index.
	bcurves := curves1 at: index .
	res := Array new: acurves size.
	
	acurves doWithIndex: [ :c1 :i | 
		c2 := bcurves at: i.
		res at: i put: (Array with: c1 first with: 
			(c1 second collect: [:point | point interpolateTo: c2 second first at: t]) )
		].
	
	^ res
]

{ #category : #testing }
RTXPSVGAnimation >> hasCompleted [
	^ animatedValue hasCompleted
]

{ #category : #public }
RTXPSVGAnimation >> on: elements during: seconds path: aBlock [
	
	| time |
	element := (elements isKindOf: RTGroup)
		ifTrue: [ elements] 
		ifFalse: [ RTGroup new add: elements ].
	curves0 := element collect: [ :e | e trachelShape curves ].
	curves1 := element collect: [ :e | e trachelShape path:( aBlock rtValue: e); curves.].
	time := curves0 size = curves1 size ifTrue: [ 0 max: seconds ] ifFalse: [ 0 ].
	animatedValue := TRVIAnimatedValue new
		evaluator: [ :t | t ];
		timer: (TRVITimer new cycleLength: time);
		yourself.
		
]

{ #category : #refreshing }
RTXPSVGAnimation >> refresh [
	element doWithIndex: [ :e :i |
		e trachelShape
			curves: (self curvesFor: i);
			computePath.
		].
	element signalUpdate.

	
]

{ #category : #actions }
RTXPSVGAnimation >> start [
	animatedValue start
]
