"
I represent a static error induced by a wrong declaration of an example. 
"
Class {
	#name : #GtExampleDependencyError,
	#superclass : #GtExampleError,
	#instVars : [
		'expected',
		'defined',
		'invalid'
	],
	#category : #'GToolkit-Examples-Exceptions'
}

{ #category : #accessing }
GtExampleDependencyError >> defined [
	^ defined
]

{ #category : #accessing }
GtExampleDependencyError >> defined: anObject [
	defined := anObject
]

{ #category : #accessing }
GtExampleDependencyError >> expected [
	^ expected
]

{ #category : #accessing }
GtExampleDependencyError >> expected: anObject [
	expected := anObject
]

{ #category : #accessing }
GtExampleDependencyError >> invalid [
	^ invalid
]

{ #category : #accessing }
GtExampleDependencyError >> invalid: anObject [
	invalid := anObject
]
