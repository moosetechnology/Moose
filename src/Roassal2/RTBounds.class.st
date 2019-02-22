"
I am a class to help layout method of RTCircularTreeMapBuilder
"
Class {
	#name : #RTBounds,
	#superclass : #RTObject,
	#instVars : [
		'circles',
		'indeces',
		'maxCircles'
	],
	#category : #'Roassal2-Builder-CircularMap'
}

{ #category : #public }
RTBounds >> findStart: circle [
	| high low probe |
	
	high := circles size +1.
	low := 1.
	[ (high - low) > 1 ] whileTrue: [ 
		probe := ((high + low )/2) floor.
		(RTCircleTree doIntersect: circle with: (circles at: probe)) 
			ifTrue: [ high := probe ]
			ifFalse: [ low := probe ]
	 ].
	^ indeces at: low.
	
]

{ #category : #comparing }
RTBounds >> max: max [
	maxCircles := max.
	circles := OrderedCollection new: max.
	indeces := OrderedCollection new: max.
]

{ #category : #public }
RTBounds >> push: circle index: index [
	| new |
	new := circles size > 0 
		ifTrue: [ RTCircleTree combine: (circles at: circles size) with: circle ] 
		ifFalse: [ circle ].
	circles add: new.
	indeces add: index.
	
	^ new.
]
