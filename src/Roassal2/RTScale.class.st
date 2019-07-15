"
A class to have nice scales checks subclasses
"
Class {
	#name : #RTScale,
	#superclass : #RTObject,
	#instVars : [
		'range',
		'domain',
		'interpolate',
		'uninterpolate'
	],
	#category : #'Roassal2-Builder-Grapher-Scaling'
}

{ #category : #'instance creation' }
RTScale class >> category10 [
	^ self ordinal 
		range: RTColorInterpolator category10;
		yourself
]

{ #category : #'instance creation' }
RTScale class >> category20 [
	^ self ordinal 
		range: RTColorInterpolator category20;
		yourself
]

{ #category : #'instance creation' }
RTScale class >> category20b [
	^ self ordinal 
		range: RTColorInterpolator category20b;
		yourself
]

{ #category : #'instance creation' }
RTScale class >> category20c [
	^ self ordinal 
		range: RTColorInterpolator category20c;
		yourself
]

{ #category : #'instance creation' }
RTScale class >> linear [
	^ RTScaleLinear new.
]

{ #category : #'instance creation' }
RTScale class >> log [
	^ RTScaleLog new

]

{ #category : #'instance creation' }
RTScale class >> ordinal [
	^ RTScaleOrdinal new
]

{ #category : #'instance creation' }
RTScale class >> pow [
	^ RTScalePow new
]

{ #category : #'instance creation' }
RTScale class >> sqrt [
	^ self pow
		exponent: 0.5; 
		yourself
]

{ #category : #accessing }
RTScale >> domain [
	^ domain
]

{ #category : #accessing }
RTScale >> domain: anObject [
	domain := anObject
]

{ #category : #accessing }
RTScale >> interpolate [
	^ interpolate
]

{ #category : #accessing }
RTScale >> interpolate: anObject [
	interpolate := anObject
]

{ #category : #transformations }
RTScale >> invert: anObject [
	self subclassResponsibility 
]

{ #category : #accessing }
RTScale >> range [
	^ range
]

{ #category : #accessing }
RTScale >> range: anObject [
	range := anObject
]

{ #category : #hooks }
RTScale >> rescale [
	self subclassResponsibility 
]

{ #category : #accessing }
RTScale >> scale: anObject [
	self subclassResponsibility 
]

{ #category : #accessing }
RTScale >> uninterpolate [
	^ uninterpolate
]

{ #category : #accessing }
RTScale >> uninterpolate: anObject [
	uninterpolate := anObject
]
