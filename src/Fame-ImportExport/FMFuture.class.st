Class {
	#name : #FMFuture,
	#superclass : #Object,
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
