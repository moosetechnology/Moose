Class {
	#name : #FAMIXCFile,
	#superclass : #FAMIXFile,
	#traits : 'FamixTWithFileIncludes',
	#classTraits : 'FamixTWithFileIncludes classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXCFile class >> annotation [

	<FMClass: #CFile super: #FAMIXFile>
	<package: #FAMIX>
	<generated>
	^self
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
	<FMProperty: #includedFiles type: #FAMIXCFile> <multivalued> <derived>
	<FMComment: 'Files included by this file.'>

	^ outgoingIncludeRelations collect: [ :each | each target ]
]

{ #category : #accessing }
FAMIXCFile >> includingFiles [
	<FMProperty: #includingFiles type: #FAMIXCFile> <multivalued> <derived>
	<FMComment: 'Files that include this file.'>

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
