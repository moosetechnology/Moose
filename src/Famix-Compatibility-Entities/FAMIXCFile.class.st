Class {
	#name : #FAMIXCFile,
	#superclass : #FAMIXFile,
	#traits : 'FamixTWithFileInclude',
	#classTraits : 'FamixTWithFileInclude classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXCFile class >> annotation [

	<MSEClass: #CFile super: #FAMIXFile>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXCFile class >> generatedSlotNames [
	<generated>
	'FAMIXCFile class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXCFile class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithFileInclude)
]

{ #category : #meta }
FAMIXCFile class >> requirements [

	<generated>
	^ {  }
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
