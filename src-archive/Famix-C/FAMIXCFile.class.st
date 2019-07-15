"
Abstract super class for Header files and Compilation units (.c files)
"
Class {
	#name : #FAMIXCFile,
	#superclass : #FAMIXFile,
	#instVars : [
		'incomingIncludeRelations',
		'outgoingIncludeRelations'
	],
	#category : #'Famix-C'
}

{ #category : #meta }
FAMIXCFile class >> annotation [
	<MSEClass: #CFile super: #FAMIXFile>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXCFile >> allIncomingIncludeRelations [
	| answer |
	answer := OrderedCollection new.
	self allIncomingIncludeRelations: answer.
	^ answer
]

{ #category : #accessing }
FAMIXCFile >> allIncomingIncludeRelations: visitedPath [
	(self incomingIncludeRelations collect: #source) do: [ :f |
		(visitedPath includes: f) ifFalse: [ 
			visitedPath add: f.
			f allIncomingIncludeRelations: visitedPath
		]
	]
]

{ #category : #accessing }
FAMIXCFile >> includedFiles [
	<MSEProperty: #includedFiles type: #FAMIXCFile> <multivalued> <derived>
	<MSEComment: 'Files included by this file.'>

	^ outgoingIncludeRelations collect: [ :each | each target ]
]

{ #category : #accessing }
FAMIXCFile >> includingFiles [
	<MSEProperty: #includingFiles type: #FAMIXCFile> <multivalued> <derived>
	<MSEComment: 'Files that include this file.'>

	^ incomingIncludeRelations collect: [ :each | each source ]
]

{ #category : #accessing }
FAMIXCFile >> incomingIncludeRelations [
	<MSEProperty: #incomingIncludeRelations type: #FAMIXInclude opposite: #target> <multivalued> <derived>
	<MSEComment: 'The include entities that have this file as a target.'>

	^ incomingIncludeRelations
]

{ #category : #accessing }
FAMIXCFile >> incomingIncludeRelations: aFile [
	incomingIncludeRelations value: aFile
]

{ #category : #'initialize-release' }
FAMIXCFile >> initialize [
	super initialize.
	incomingIncludeRelations := FMNullMultivalueLink on: self opposite: #target: selector: #incomingIncludeRelations.
	outgoingIncludeRelations := FMNullMultivalueLink on: self opposite: #source: selector: #outgoingIncludeRelations.
]

{ #category : #testing }
FAMIXCFile >> isCompilationUnit [
	^ false
]

{ #category : #testing }
FAMIXCFile >> isHeader [
	^ false
]

{ #category : #queries }
FAMIXCFile >> numberOfIncludes [
	"Return the number of files I include"
	^ outgoingIncludeRelations size
]

{ #category : #accessing }
FAMIXCFile >> outgoingIncludeRelations [
	<MSEProperty: #outgoingIncludeRelations type: #FAMIXInclude opposite: #source> <multivalued> <derived>
	<MSEComment: 'The include entities that have this file as a source.'>

	^ outgoingIncludeRelations
]

{ #category : #accessing }
FAMIXCFile >> outgoingIncludeRelations: aFile [
	outgoingIncludeRelations value: aFile
]
