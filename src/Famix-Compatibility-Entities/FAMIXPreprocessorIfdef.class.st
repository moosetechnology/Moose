Class {
	#name : #FAMIXPreprocessorIfdef,
	#superclass : #FAMIXPreprocessorStatement,
	#instVars : [
		'macro',
		'negated'
	],
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXPreprocessorIfdef class >> annotation [

	<MSEClass: #PreprocessorIfdef super: #FAMIXPreprocessorStatement>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXPreprocessorIfdef class >> generatedSlotNames [
	<generated>
	'FAMIXPreprocessorIfdef class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXPreprocessorIfdef class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FAMIXPreprocessorIfdef class >> requirements [

	<generated>
	^ {  }
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
