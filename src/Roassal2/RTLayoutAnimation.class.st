Class {
	#name : #RTLayoutAnimation,
	#superclass : #RTAnimation,
	#instVars : [
		'layout',
		'elements'
	],
	#category : #'Roassal2-Animation'
}

{ #category : #accessing }
RTLayoutAnimation >> elements [
	^ elements
]

{ #category : #accessing }
RTLayoutAnimation >> elements: anObject [
	elements := anObject
]

{ #category : #testing }
RTLayoutAnimation >> hasCompleted [
	^ false
]

{ #category : #initialization }
RTLayoutAnimation >> initialize [
	super initialize.
	layout := RTGridLayout new
]

{ #category : #accessing }
RTLayoutAnimation >> layout [
	^ layout
]

{ #category : #accessing }
RTLayoutAnimation >> layout: anObject [
	layout := anObject
]

{ #category : #refreshing }
RTLayoutAnimation >> refresh [
	layout on: elements.
	
]
