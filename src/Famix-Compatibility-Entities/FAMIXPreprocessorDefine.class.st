Class {
	#name : #FAMIXPreprocessorDefine,
	#superclass : #FAMIXPreprocessorStatement,
	#traits : 'FamixTPreprocessorIfdef',
	#classTraits : 'FamixTPreprocessorIfdef classTrait',
	#instVars : [
		'macro'
	],
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXPreprocessorDefine class >> annotation [

	<FMClass: #PreprocessorDefine super: #FAMIXPreprocessorStatement>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #accessing }
FAMIXPreprocessorDefine >> macro [
	<FMProperty: #macro type: #String>
	<FMComment: 'The name of the macro being defined'>
	^ macro
]

{ #category : #accessing }
FAMIXPreprocessorDefine >> macro: anObject [
	macro := anObject
]
