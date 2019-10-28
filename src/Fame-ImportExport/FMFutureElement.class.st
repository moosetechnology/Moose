Class {
	#name : #FMFutureElement,
	#superclass : #FMFuture,
	#instVars : [
		'instance',
		'metaDescription',
		'currentAttribute'
	],
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #'instance creation' }
FMFutureElement class >> with: anImporter name: aString [

	^self new with: anImporter name: aString
]

{ #category : #parsing }
FMFutureElement >> beginAttribute: aString [
	self assert: currentAttribute isNil.
	currentAttribute := FMFutureAttribute with: self name: aString
]

{ #category : #accessing }
FMFutureElement >> currentAttribute [
	^ currentAttribute
]

{ #category : #parsing }
FMFutureElement >> endAttribute: aString [
	currentAttribute endAttribute: aString.
	currentAttribute := nil
]

{ #category : #accessing }
FMFutureElement >> importer [
	^ self owner
]

{ #category : #accessing }
FMFutureElement >> instance [
	^ instance
]

{ #category : #accessing }
FMFutureElement >> metaDescription [
	^ metaDescription
]

{ #category : #parsing }
FMFutureElement >> serial: serial [
	self importer assign: instance to: serial
]

{ #category : #'initialize-release' }
FMFutureElement >> with: anImporter name: aString [
	super with: anImporter name: aString.
	metaDescription := self importer metamodel elementNamed: aString.
	instance := metaDescription createInstance
]
