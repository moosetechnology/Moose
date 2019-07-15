Class {
	#name : #REPConcernStatus,
	#superclass : #Object,
	#instVars : [
		'value',
		'concern'
	],
	#category : #'Arki-Reporter-Core'
}

{ #category : #accessing }
REPConcernStatus >> color [ 
	^ Color black
]

{ #category : #accessing }
REPConcernStatus >> concern [
	^ concern
]

{ #category : #accessing }
REPConcernStatus >> concern: anObject [
	concern := anObject
]

{ #category : #testing }
REPConcernStatus >> isErrorStatus [
	^ false
]

{ #category : #testing }
REPConcernStatus >> isFailureStatus [
	^ false
]

{ #category : #testing }
REPConcernStatus >> isNeutralStatus [
	^ false
]

{ #category : #testing }
REPConcernStatus >> isSuccessStatus [
	^ false
]

{ #category : #accessing }
REPConcernStatus >> label [ 
	^ Text 
		string: self concern label 
		attribute: (TextColor new color: self color)
]

{ #category : #accessing }
REPConcernStatus >> union: aStatus [
	^ aStatus species new
]

{ #category : #accessing }
REPConcernStatus >> value [
	^ value
]

{ #category : #accessing }
REPConcernStatus >> value: anObject [
	value := anObject
]
