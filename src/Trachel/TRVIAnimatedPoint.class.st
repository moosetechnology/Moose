Class {
	#name : #TRVIAnimatedPoint,
	#superclass : #TRObject,
	#instVars : [
		'x',
		'y'
	],
	#category : #'Trachel-Viva'
}

{ #category : #'as yet unclassified' }
TRVIAnimatedPoint >> + anotherPoint [
	^ TRVIAnimatedPoint new 
		x: [ self x value + (anotherPoint x) ];
		y: [ self y value + (anotherPoint y) ];
		yourself
		
"	^ VIAnimatedPoint new 
		x: [ :time | (self x value: time) + (anotherPoint x value: time) ];
		y: [ :time | (self y value: time) + (anotherPoint y value: time) ];
		yourself"
]

{ #category : #'as yet unclassified' }
TRVIAnimatedPoint >> - anotherPoint [
	^ TRVIAnimatedPoint new 
		x: [ self x value - (anotherPoint x) ];
		y: [ self y value - (anotherPoint y) ];
		yourself
		
"	^ VIAnimatedPoint new 
		x: [ :time | (self x value: time) + (anotherPoint x value: time) ];
		y: [ :time | (self y value: time) + (anotherPoint y value: time) ];
		yourself"
]

{ #category : #initialization }
TRVIAnimatedPoint >> initialize [
	super initialize.
	x := 0.
	y := 0.
]

{ #category : #accessing }
TRVIAnimatedPoint >> x [
	^ x
]

{ #category : #accessing }
TRVIAnimatedPoint >> x: anObject [
	x := anObject
]

{ #category : #accessing }
TRVIAnimatedPoint >> y [
	^ y
]

{ #category : #accessing }
TRVIAnimatedPoint >> y: anObject [
	y := anObject
]
