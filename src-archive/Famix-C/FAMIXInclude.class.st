"
An association to represent include relationships between .c and .h files
"
Class {
	#name : #FAMIXInclude,
	#superclass : #FAMIXAssociation,
	#instVars : [
		'source',
		'target'
	],
	#category : #'Famix-C'
}

{ #category : #meta }
FAMIXInclude class >> annotation [
	<MSEClass: #Include super: #FAMIXAssociation>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXInclude >> from [	
	^ self source
]

{ #category : #accessing }
FAMIXInclude >> source [
	<MSEProperty: #source type: #FAMIXCFile opposite: #outgoingIncludeRelations>
	<MSEComment: 'The C file that is including'>
	<source>
	^ source
]

{ #category : #accessing }
FAMIXInclude >> source: aFile [

	source := FMMultivalueLink on: self
					update: #outgoingIncludeRelations
					from: self source
					to: aFile

]

{ #category : #accessing }
FAMIXInclude >> target [
	<MSEProperty: #target type: #FAMIXCFile opposite: #incomingIncludeRelations>
	<MSEComment: 'The C file that is included'>
	<target>
	^ target
]

{ #category : #accessing }
FAMIXInclude >> target: aFile [
	target := FMMultivalueLink on: self
					update: #incomingIncludeRelations
					from: self target
					to: aFile

]

{ #category : #accessing }
FAMIXInclude >> to [
	^ self target
]
