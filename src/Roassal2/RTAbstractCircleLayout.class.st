"
A ROAbstractCircleLayout is xxxxxxxxx.

Instance Variables
	factor:		<Object>
	initialAngle:		<Object>
	initialIncrementalAngle:		<Object>
	initialRadius:		<Object>

factor
	- xxxxx

initialAngle
	- xxxxx

initialIncrementalAngle
	- xxxxx

initialRadius
	- xxxxx

"
Class {
	#name : #RTAbstractCircleLayout,
	#superclass : #RTLayout,
	#instVars : [
		'initialAngle',
		'initialIncrementalAngle',
		'initialRadius',
		'factor'
	],
	#category : #'Roassal2-Layouts'
}

{ #category : #public }
RTAbstractCircleLayout class >> isAbstract [
	^ self name = #RTAbstractCircleLayout
]

{ #category : #hook }
RTAbstractCircleLayout >> computeIncrementalAngleFor: elements [
	"Return the value _in radian_ of the incremental angle"
	
	^ initialIncrementalAngle = 0
		ifTrue: [ 2 * Float pi / elements size ]
		ifFalse: [ initialIncrementalAngle ]
]

{ #category : #hook }
RTAbstractCircleLayout >> computeRadiusFor: elements [
	"Return the radius of the circle. If none has been set (i.e., initialRadius = 0), then it is computed as the scale factor times the number of elements"
	^ initialRadius = 0 
		ifTrue: [ elements size * self scaleFactor ]
		ifFalse: [ initialRadius ]
]

{ #category : #accessing }
RTAbstractCircleLayout >> initialAngle [
	"Return the initial angle, in radian"
	^ initialAngle
]

{ #category : #accessing }
RTAbstractCircleLayout >> initialAngle: aFloat [
	"aFloat is an angle in Radian."
	initialAngle := aFloat
]

{ #category : #accessing }
RTAbstractCircleLayout >> initialAngleInDegree [ 
	"Return the initial angle in degree"
	^ self initialAngle * 180 / Float pi
]

{ #category : #accessing }
RTAbstractCircleLayout >> initialAngleInDegree: aNumber [
	"Set the initial angle in radian"
	self initialAngle: aNumber * Float pi / 180
]

{ #category : #accessing }
RTAbstractCircleLayout >> initialIncrementalAngle [
	"Return the initial incremental angle"
	^ initialIncrementalAngle
]

{ #category : #accessing }
RTAbstractCircleLayout >> initialIncrementalAngle: aNumberInRadian [
	initialIncrementalAngle := aNumberInRadian
]

{ #category : #accessing }
RTAbstractCircleLayout >> initialIncrementalAngleInDegree: aNumberInDegree [
	self initialIncrementalAngle: aNumberInDegree * Float pi / 180
]

{ #category : #accessing }
RTAbstractCircleLayout >> initialRadius [
	"Return the radius in pixels of the circle"
	^ initialRadius
]

{ #category : #accessing }
RTAbstractCircleLayout >> initialRadius: aNumber [
	"Set the radius of the circle"
	initialRadius := aNumber
]

{ #category : #'initialize-release' }
RTAbstractCircleLayout >> initialize [
	"Initialize a newly created instance. This method must answer the receiver."
	
	super initialize.
	self scaleBy: 11.
	
	"Represent the initial angle to place the elements"
	initialAngle := 0.
	
	"Distance of the circle. If it is 0 when entering doExecute, then it is computed"
	initialRadius := 0.
	
	"0 means that it is computed, and not set by the user"
	initialIncrementalAngle := 0.
]

{ #category : #accessing }
RTAbstractCircleLayout >> radius: aNumber [
	^ self initialRadius: aNumber
]

{ #category : #accessing }
RTAbstractCircleLayout >> scaleBy: aNumber [
	
	factor := aNumber
]

{ #category : #accessing }
RTAbstractCircleLayout >> scaleFactor [
	^ factor
]
