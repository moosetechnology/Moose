"
Represent a preprocessor #ifdef/#ifndef statement

Knows the name of the macro tested and whether it is ""negated"" (#ifndef) or not (#ifdef)
"
Class {
	#name : #FAMIXPreprocessorIfdef,
	#superclass : #FAMIXPreprocessorStatement,
	#instVars : [
		'macro',
		'negated'
	],
	#category : #'Famix-C'
}

{ #category : #meta }
FAMIXPreprocessorIfdef class >> annotation [
	<MSEClass: #PreprocessorIfdef super: #FAMIXPreprocessorStatement>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXPreprocessorIfdef >> isNegated [
	<MSEProperty: #negated type: #Boolean>
	<MSEComment: 'Whether it is an #ifdef (false) or #ifndef (true)'>
	^ negated
]

{ #category : #accessing }
FAMIXPreprocessorIfdef >> isNegated: aBoolean [
	negated := aBoolean
]

{ #category : #accessing }
FAMIXPreprocessorIfdef >> macro [
	<MSEProperty: #macro type: #String>
	<MSEComment: 'The name of the macro being tested'>
	^ macro
]

{ #category : #accessing }
FAMIXPreprocessorIfdef >> macro: anObject [
	macro := anObject
]
