Class {
	#name : #FMFutureProperty,
	#superclass : #FMFuture,
	#instVars : [
		'name',
		'values',
		'numberOfDanglingReferences'
	],
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #'instance creation' }
FMFutureProperty class >> with: anImporter name: aString [

	^self new with: anImporter name: aString
]

{ #category : #parsing }
FMFutureProperty >> endProperty: aString [
	"A well formated MSE file should end a property with 0 dangling references and we could assert it. But removing the assertiong makes the parser tolerant so some defects in MSE files."

	self maybeEnd
]

{ #category : #accessing }
FMFutureProperty >> importer [
	^ self owner importer
]

{ #category : #parsing }
FMFutureProperty >> maybeEnd [
	| property |
	numberOfDanglingReferences isZero ifFalse: [ ^ self ].

	property := owner metaDescription
		propertyNamed: name
		ifAbsent: [ owner instance handleFameProperty: name value: values.
			^ self ].

	property setOn: owner instance values: values
]

{ #category : #parsing }
FMFutureProperty >> referenceNumber: serial [
	values
		add:
			(self importer index
				at: serial
				ifAbsent: [ self importer dangling: (FMDanglingReference with: self) to: serial.
					numberOfDanglingReferences := numberOfDanglingReferences + 1 ])
]

{ #category : #parsing }
FMFutureProperty >> replaceDanglingReferenceAt: anInteger by: anElement [
	self values at: anInteger put: anElement.
	numberOfDanglingReferences := numberOfDanglingReferences - 1.
	self maybeEnd
]

{ #category : #accessing }
FMFutureProperty >> values [
	^ values
]

{ #category : #'initialize-release' }
FMFutureProperty >> with: aFutureElement name: aString [
	super with: aFutureElement name: aString.
	numberOfDanglingReferences := 0.
	name := aString.
	values := OrderedCollection new
]
