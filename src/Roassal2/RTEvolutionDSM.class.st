"
I am a simple draw of evolution group
"
Class {
	#name : #RTEvolutionDSM,
	#superclass : #RTGradualDSM,
	#instVars : [
		'timelineBlock'
	],
	#category : #'Roassal2-Builder-DSM'
}

{ #category : #UI }
RTEvolutionDSM >> defaultCellShape [
	^ (RTCompositeShape new 
		add: (RTPolygon rectangle);
		add: ( RTSparkline new
			size: self cellSize);
			color: Color transparent;
		yourself)
]

{ #category : #initialization }
RTEvolutionDSM >> initialize [
	super initialize.
	self timeline: [ :evoline |
		nil ].
	self createObjectBlock: [ :assoc | | inst |
		inst := RTEvolutionLine new 
			xvalue: assoc key;
			yvalue: assoc value.
		inst timeline: (self timeline value: inst).
		inst ].
]

{ #category : #accessing }
RTEvolutionDSM >> sparklineValues: ablock size: aNumber [
	| shapes |
	shapes := self shape shape allShapes.
	shapes first size: aNumber.
	shapes second
		width: aNumber;
		height: aNumber;
		values: ablock.
]

{ #category : #accessing }
RTEvolutionDSM >> timeline [
	^ timelineBlock
]

{ #category : #accessing }
RTEvolutionDSM >> timeline: aBlock [
	timelineBlock := aBlock
]
