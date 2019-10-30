Class {
	#name : #FMFuture,
	#superclass : #Object,
	#instVars : [
		'owner'
	],
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #accessing }
FMFuture >> importer [
	^ self subclassResponsibility
]

{ #category : #accessing }
FMFuture >> owner [
	^owner
]

{ #category : #'initialize-release' }
FMFuture >> with: anOwner name: aString [
	owner := anOwner
]
