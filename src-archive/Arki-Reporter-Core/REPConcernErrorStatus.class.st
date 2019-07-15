Class {
	#name : #REPConcernErrorStatus,
	#superclass : #REPConcernStatus,
	#instVars : [
		'errorInstance'
	],
	#category : #'Arki-Reporter-Core'
}

{ #category : #accessing }
REPConcernErrorStatus >> color [ 
	^ Color gray
]

{ #category : #accessing }
REPConcernErrorStatus >> errorInstance [
	^ errorInstance
]

{ #category : #accessing }
REPConcernErrorStatus >> errorInstance: anObject [
	errorInstance := anObject
]

{ #category : #testing }
REPConcernErrorStatus >> isErrorStatus [
	^ true
]

{ #category : #accessing }
REPConcernErrorStatus >> union: aStatus [
	^ (aStatus isSuccessStatus or: [ aStatus isFailureStatus ])
		ifTrue: [ aStatus species new ]
		ifFalse: [ REPConcernNeutralStatus new ]
]
