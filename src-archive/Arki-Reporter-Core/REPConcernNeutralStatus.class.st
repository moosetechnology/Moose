Class {
	#name : #REPConcernNeutralStatus,
	#superclass : #REPConcernStatus,
	#category : #'Arki-Reporter-Core'
}

{ #category : #accessing }
REPConcernNeutralStatus >> color [ 
	^ Color black
]

{ #category : #testing }
REPConcernNeutralStatus >> isNeutralStatus [
	^ true
]

{ #category : #accessing }
REPConcernNeutralStatus >> union: aStatus [
	^ aStatus isErrorStatus 
		ifTrue: [self species new]
		ifFalse: [aStatus species new]
]
