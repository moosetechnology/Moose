"
I am an utility class for RTLabelGenerator
"
Class {
	#name : #RTGrapherLabel,
	#superclass : #RTObject,
	#instVars : [
		'min',
		'max',
		'step',
		'score'
	],
	#category : #'Roassal2-Builder-Grapher-Labeling'
}

{ #category : #accessing }
RTGrapherLabel >> max [
	^ max
]

{ #category : #accessing }
RTGrapherLabel >> max: aNumber [
	max := aNumber
]

{ #category : #accessing }
RTGrapherLabel >> min [
	^ min
]

{ #category : #accessing }
RTGrapherLabel >> min: aNumber [
	min := aNumber
]

{ #category : #accessing }
RTGrapherLabel >> numberOfTicks [
	| ticks |
	min < 0 ifTrue: [ 
		ticks := max < 0 ifTrue: [ (max - min) abs ] ifFalse: [ max+min abs  ]
		 ] ifFalse: [ 
		ticks := max - min ].
	^ (ticks / step).
	
]

{ #category : #printing }
RTGrapherLabel >> printOn: aStream [
	| x |
	aStream 
		nextPutAll: '(Score: ';
		nextPutAll: (score printShowingDecimalPlaces: 2);
		nextPutAll: ') '.
	x := min.
	[x <= max ] whileTrue: [ 
		aStream nextPutAll: (x printShowingDecimalPlaces: 2).
		aStream nextPutAll: String tab.
		x := x + step ].
	
	
]

{ #category : #accessing }
RTGrapherLabel >> score [
	^ score
]

{ #category : #accessing }
RTGrapherLabel >> score: aNumber [
	score := aNumber
]

{ #category : #accessing }
RTGrapherLabel >> step [
	^ step
]

{ #category : #accessing }
RTGrapherLabel >> step: aNumber [
	step := aNumber
]
