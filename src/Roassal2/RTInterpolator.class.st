"
I am a base Interpolator, my sbuclasses are
	RTColorInterpolator, and RTNumberInterpolator
	
"
Class {
	#name : #RTInterpolator,
	#superclass : #RTObject,
	#instVars : [
		'start',
		'stop'
	],
	#category : #'Roassal2-Builder-Grapher-Scaling'
}

{ #category : #'as yet unclassified' }
RTInterpolator class >> interpolate: a and: b [
	| clazz |
	clazz := self interpolatorFor: b.
	
	^ clazz new start: a; stop: b .
		
]

{ #category : #interpolation }
RTInterpolator class >> interpolatorFor: b [
	(b isString or: [ b isColor ]) ifTrue: [ ^ RTColorInterpolator ].
	b isNumber ifTrue: [ ^ RTNumberInterpolator ].
	
	self error: 'Invalid value for interpolator'
]

{ #category : #accessing }
RTInterpolator >> interpolate: anObject [
	self subclassResponsibility 
]

{ #category : #accessing }
RTInterpolator >> start: anObject [
	start := anObject
]

{ #category : #accessing }
RTInterpolator >> stop: anObject [
	stop := anObject
]
