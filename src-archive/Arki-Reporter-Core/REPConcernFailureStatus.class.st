Class {
	#name : #REPConcernFailureStatus,
	#superclass : #REPConcernStatus,
	#category : #'Arki-Reporter-Core'
}

{ #category : #accessing }
REPConcernFailureStatus >> color [ 
	^ Color red darker
]

{ #category : #testing }
REPConcernFailureStatus >> isFailureStatus [
	^ true
]

{ #category : #accessing }
REPConcernFailureStatus >> union: aStatus [
	^ self species new
]
