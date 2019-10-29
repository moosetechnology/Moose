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

	<FMClass: #PreprocessorIfdef super: #FAMIXPreprocessorStatement>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #accessing }
FAMIXPreprocessorIfdef >> isNegated [
	<FMProperty: #negated type: #Boolean>
	<FMComment: 'Whether it is an #ifdef (false) or #ifndef (true)'>
	^ negated
]

{ #category : #accessing }
FAMIXPreprocessorIfdef >> isNegated: aBoolean [
	negated := aBoolean
]

{ #category : #accessing }
FAMIXPreprocessorIfdef >> macro [
	<FMProperty: #macro type: #String>
	<FMComment: 'The name of the macro being tested'>
	^ macro
]

{ #category : #accessing }
FAMIXPreprocessorIfdef >> macro: anObject [
	macro := anObject
]
