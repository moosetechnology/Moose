"
Represent a preprocessor #define statement

Knows the name of the macro defined
"
Class {
	#name : #FAMIXPreprocessorDefine,
	#superclass : #FAMIXPreprocessorStatement,
	#instVars : [
		'macro'
	],
	#category : #'Famix-C'
}

{ #category : #meta }
FAMIXPreprocessorDefine class >> annotation [
	<MSEClass: #PreprocessorDefine super: #FAMIXPreprocessorStatement>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXPreprocessorDefine >> macro [
	<MSEProperty: #macro type: #String>
	<MSEComment: 'The name of the macro being defined'>
	^ macro
]

{ #category : #accessing }
FAMIXPreprocessorDefine >> macro: anObject [
	macro := anObject
]
