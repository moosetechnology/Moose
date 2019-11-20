Class {
	#name : #FMFutureElement,
	#superclass : #FMFuture,
	#instVars : [
		'instance',
		'metaDescription',
		'currentProperty',
		'importer'
	],
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #parsing }
FMFutureElement >> beginProperty: aString [
	self assert: currentProperty isNil.
	currentProperty := FMFutureProperty in: self named: aString
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
	^ importer
]

{ #category : #initialization }
FMFutureElement >> in: anImporter named: aString [
	importer := anImporter.
	metaDescription := importer metamodel elementNamed: aString.
	instance := metaDescription createInstance
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
