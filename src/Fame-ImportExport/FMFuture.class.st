Class {
	#name : #FMFuture,
	#superclass : #Object,
	#instVars : [
		'metaDescription'
	],
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #'instance creation' }
FMFuture class >> in: anImporter named: aString [
	^ self new
		in: anImporter named: aString;
		yourself
]

{ #category : #accessing }
FMFuture >> importer [
	^ self subclassResponsibility
]

{ #category : #initialization }
FMFuture >> in: anOwner named: aString [
	self subclassResponsibility
]

{ #category : #accessing }
FMFuture >> metaDescription [
	^ metaDescription
]
