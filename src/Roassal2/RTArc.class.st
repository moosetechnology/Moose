"
A RTArc is an arc portion. e.g., 
	RTArc new externalRadius: 100; innerRadius: 20; outerAngle: 45 innerAngle: 90

Instance Variables
	alphaAngle:		<Object>
	betaAngle:		<Object>
	externalRadius:		<Object>
	innerRadius:		<Object>

alphaAngle
	- xxxxx

betaAngle
	- xxxxx

externalRadius
	- xxxxx

innerRadius
	- xxxxx

"
Class {
	#name : #RTArc,
	#superclass : #RTShape,
	#instVars : [
		'alphaAngle',
		'betaAngle',
		'innerRadius',
		'externalRadius'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #accessing }
RTArc >> alphaAngle [
	^ alphaAngle
]

{ #category : #accessing }
RTArc >> alphaAngle: aValueOrAOneArgBlock [
	"aValueOrAOneArgBlock is applied on the object model"
	self alphaAngleElement: [ :anElement | aValueOrAOneArgBlock rtValue: anElement model ]
]

{ #category : #accessing }
RTArc >> alphaAngleElement: anObject [
	alphaAngle := anObject
]

{ #category : #computing }
RTArc >> alphaAngleFor: anElement [
	^ (alphaAngle rtValue: anElement)
]

{ #category : #accessing }
RTArc >> betaAngle [
	^ betaAngle
]

{ #category : #accessing }
RTArc >> betaAngle: aValueOrAOneArgBlock [
	"aValueOrAOneArgBlock is applied on the object model"
	self betaAngleElement: [ :anElement | aValueOrAOneArgBlock rtValue: anElement model ]
]

{ #category : #accessing }
RTArc >> betaAngleElement: angleInRadian [
	betaAngle := angleInRadian
]

{ #category : #computing }
RTArc >> betaAngleFor: anElement [
	^ (betaAngle rtValue: anElement)
]

{ #category : #accessing }
RTArc >> encompassingRectangle [

	^ 0 @ 0 extent: 40 @ 50
]

{ #category : #accessing }
RTArc >> externalRadius [
	^ externalRadius
]

{ #category : #accessing }
RTArc >> externalRadius: aValueOrAOneArgBlock [
	"aValueOrAOneArgBlock is applied on the object model"
	self externalRadiusElement: [ :anElement | aValueOrAOneArgBlock rtValue: anElement model ]
]

{ #category : #accessing }
RTArc >> externalRadiusElement: aValue [ 	
	externalRadius := aValue
]

{ #category : #computing }
RTArc >> externalRadiusFor: anElement [
	^ (externalRadius rtValue: anElement)
]

{ #category : #initialization }
RTArc >> initialize [
	super initialize.
	self alphaAngle: 0.
	self betaAngle: 35.
	self innerRadius: 30.
	self externalRadius: 50.
]

{ #category : #accessing }
RTArc >> innerRadius [
	^ innerRadius
]

{ #category : #accessing }
RTArc >> innerRadius: aValueOrAOneArgBlock [
	"aValueOrAOneArgBlock is applied on the object model"
	self innerRadiusElement: [ :anElement | aValueOrAOneArgBlock rtValue: anElement model ]
]

{ #category : #accessing }
RTArc >> innerRadiusElement: anObject [
	innerRadius := anObject
]

{ #category : #computing }
RTArc >> innerRadiusFor: anElement [
	^ (innerRadius rtValue: anElement)
]

{ #category : #accessing }
RTArc >> outerAngle: o innerAngle: i [
	self alphaAngleElement: [ :e | (o rtValue: e) ].
	self betaAngleElement: [ :e | (o rtValue: e) + (i rtValue: e) ]
]

{ #category : #accessing }
RTArc >> thickness: aBlockOrAValue [
	self externalRadius: [ :o | (self innerRadiusFor: (RTElement on: o)) + (aBlockOrAValue rtValue: o) ]
]

{ #category : #hooks }
RTArc >> trachelShapeClass [
	^ TRArcShape
]

{ #category : #hooks }
RTArc >> updateFor: anElement trachelShape: trachelShape [
	trachelShape isNil ifTrue: [ ^ self ].
	trachelShape 
		alphaAngle: (self alphaAngleFor: anElement) 
		betaAngle: (self betaAngleFor: anElement)  
		innerRadius: (self innerRadiusFor: anElement) 
		externalRadius: (self externalRadiusFor: anElement);
		color: (self colorFor: anElement);
		rotateByDegrees:  (self rotationFor: anElement);
		scaleBy: (self scaleFor: anElement).
	^ trachelShape
]
