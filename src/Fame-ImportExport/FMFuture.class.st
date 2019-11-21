"
Description
--------------------

I represent a future element of a model. My subclasses will be used by FMImporter during the import of a model.

Futures knows their meta-description and will use that to create and inject information into the real entities.	
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	metaDescription:		<aFM3Element>		The meta-description of the entity represented by this future.
"
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
