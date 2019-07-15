"
I represent a compilation unit file. Typically a .c or .cpp file
"
Class {
	#name : #FAMIXCompilationUnit,
	#superclass : #FAMIXCFile,
	#instVars : [
		'module',
		'headers'
	],
	#category : #'Famix-C'
}

{ #category : #meta }
FAMIXCompilationUnit class >> annotation [
	<MSEClass: #CompilationUnit super: #FAMIXCFile>
	<package: #FAMIX>
]

{ #category : #'initialize-release' }
FAMIXCompilationUnit >> initialize [
	super initialize.
	headers := OrderedCollection new.
]

{ #category : #testing }
FAMIXCompilationUnit >> isCompilationUnit [
	^ true
]

{ #category : #accessing }
FAMIXCompilationUnit >> module [
	<MSEProperty: #module type: #FAMIXModule opposite: #compilationUnit>
	<MSEComment: 'Module that contains the definition of this compilation unit'>
	^ module
]

{ #category : #accessing }
FAMIXCompilationUnit >> module: aFAMIXModule [
	module := aFAMIXModule
]
