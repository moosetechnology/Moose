Class {
	#name : #FMFutureElement,
	#superclass : #FMFuture,
	#instVars : [
		'instance',
		'metaDescription',
		'currentProperty'
	],
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #'instance creation' }
FMFutureElement class >> with: anImporter name: aString [

	^self new with: anImporter name: aString
]

{ #category : #parsing }
FMFutureElement >> beginProperty: aString [
	self assert: currentProperty isNil.
	currentProperty := FMFutureProperty with: self name: aString
]

{ #category : #accessing }
FMFutureElement >> currentProperty [
	^ currentProperty
]

{ #category : #parsing }
FMFutureElement >> endProperty: aString [
	currentProperty endProperty: aString.
	currentProperty := nil
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
