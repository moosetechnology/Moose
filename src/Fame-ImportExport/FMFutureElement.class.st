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

{ #category : #adding }
FMFutureElement >> addToPropertyValues: anObject [
	self currentProperty addToValues: anObject
]

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
FMFutureElement >> endProperty [
	"A well formated MSE file should end a property with 0 dangling references and we could assert it. But removing the assertiong makes the parser tolerant so some defects in MSE files."

	currentProperty maybeEnd.
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
