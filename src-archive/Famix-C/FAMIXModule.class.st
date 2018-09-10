"
FAMIXModule represents a that basically provides a simple scoping abstraction for a .C/.CPP/.H files.

"
Class {
	#name : #FAMIXModule,
	#superclass : #FAMIXScopingEntity,
	#instVars : [
		'compilationUnit',
		'header'
	],
	#category : #'Famix-C'
}

{ #category : #meta }
FAMIXModule class >> annotation [
	<MSEClass: #Module super: #FAMIXScopingEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXModule >> classes [ 
	^ #()
]

{ #category : #accessing }
FAMIXModule >> compilationUnit [
	<MSEProperty: #compilationUnit type: #FAMIXCompilationUnit opposite: #module>
	<derived>
	<MSEComment: 'The compilation unit that defines this module'>
	^ compilationUnit
]

{ #category : #accessing }
FAMIXModule >> compilationUnit: aCompilationUnit [
	compilationUnit := aCompilationUnit
]

{ #category : #accessing }
FAMIXModule >> header [
	<MSEProperty: #header type: #FAMIXHeader opposite: #module>
	<derived>
	<MSEComment: 'The header file that defines this module'>
	^ header
]

{ #category : #accessing }
FAMIXModule >> header: anObject [
	header := anObject
]
