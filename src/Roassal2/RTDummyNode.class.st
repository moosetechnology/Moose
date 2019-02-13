"
A RODummyNode is used by the sugiyama layout
"
Class {
	#name : #RTDummyNode,
	#superclass : #RTObject,
	#instVars : [
		'edge'
	],
	#category : #'Roassal2-Layouts'
}

{ #category : #'instance creation' }
RTDummyNode class >> on: anEdge slot: anIndex [
	
	^(self new)
		edge: anEdge;
		slot: anIndex;
		yourself
]

{ #category : #accessing }
RTDummyNode >> edge [
	
	^edge
]

{ #category : #accessing }
RTDummyNode >> edge: anEdge [
	
	edge := anEdge
]

{ #category : #accessing }
RTDummyNode >> extent [
	^ self height @ self width
]

{ #category : #accessing }
RTDummyNode >> height [
	
	^0
]

{ #category : #accessing }
RTDummyNode >> position [
	^ 0 @ 0
]

{ #category : #accessing }
RTDummyNode >> signalUpdate [
	"do nothing"
]

{ #category : #accessing }
RTDummyNode >> slot: anIndex [
	
]

{ #category : #accessing }
RTDummyNode >> translateBy: apoint [
	"do nothing"
]

{ #category : #accessing }
RTDummyNode >> translateTo: aPoint [
	
	"edge index: index point: aPoint"
]

{ #category : #accessing }
RTDummyNode >> view [
	^ RTView new
]

{ #category : #accessing }
RTDummyNode >> width [
	
	^0
]
