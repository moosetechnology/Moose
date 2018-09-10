Class {
	#name : #REPConcernSuccessStatus,
	#superclass : #REPConcernStatus,
	#category : #'Arki-Reporter-Core'
}

{ #category : #accessing }
REPConcernSuccessStatus >> color [ 
	^ Color green muchDarker
]

{ #category : #testing }
REPConcernSuccessStatus >> isSuccessStatus [
	^ true
]

{ #category : #accessing }
REPConcernSuccessStatus >> union: aStatus [
	^ aStatus isFailureStatus 
		ifTrue: [ aStatus species new ]
		ifFalse: [ self species new ]
]
