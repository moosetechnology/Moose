Class {
	#name : #RTMockEdge,
	#superclass : #RTObject,
	#instVars : [
		'from',
		'to'
	],
	#category : #'Roassal2-Layouts'
}

{ #category : #accessing }
RTMockEdge >> from [
	^ from
]

{ #category : #accessing }
RTMockEdge >> from: aMockElement [
	from := aMockElement
]

{ #category : #accessing }
RTMockEdge >> to [
	^ to
]

{ #category : #accessing }
RTMockEdge >> to: aMockElement [
	to := aMockElement
]
