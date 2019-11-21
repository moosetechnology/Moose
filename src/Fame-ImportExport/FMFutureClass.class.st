"
Description
--------------------

I am a repersentation of a future object of the model been imported.

I am used by FMImporter while the real object is not yet created.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	currentProperty:		<aFMFutureProperty> 	The current property been imported that is owned by the class I represent.
	importer:					<aFMImporter>			The importer importing the class I represent.
	instance:					<anObject>				The real object been imported.

"
Class {
	#name : #FMFutureClass,
	#superclass : #FMFuture,
	#instVars : [
		'instance',
		'currentProperty',
		'importer'
	],
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #adding }
FMFutureClass >> addToPropertyValues: anObject [
	self currentProperty addToValues: anObject
]

{ #category : #parsing }
FMFutureClass >> beginProperty: aString [
	self assert: currentProperty isNil.
	currentProperty := FMFutureProperty in: self named: aString
]

{ #category : #accessing }
FMFutureClass >> currentProperty [
	^ currentProperty
]

{ #category : #parsing }
FMFutureClass >> endProperty [
	"A well formated MSE file should end a property with 0 dangling references and we could assert it. But removing the assertiong makes the parser tolerant so some defects in MSE files."

	currentProperty maybeEnd.
	currentProperty := nil
]

{ #category : #accessing }
FMFutureClass >> importer [
	^ importer
]

{ #category : #initialization }
FMFutureClass >> in: anImporter named: aString [
	importer := anImporter.
	metaDescription := importer metamodel elementNamed: aString.
	instance := metaDescription createInstance
]

{ #category : #accessing }
FMFutureClass >> instance [
	^ instance
]
