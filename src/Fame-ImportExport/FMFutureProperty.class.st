Class {
	#name : #FMFutureProperty,
	#superclass : #FMFuture,
	#instVars : [
		'name',
		'values',
		'tally'
	],
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #'instance creation' }
FMFutureProperty class >> with: anImporter name: aString [

	^self new with: anImporter name: aString
]

{ #category : #accessing }
FMFutureProperty >> count [
	^ tally
]

{ #category : #accessing }
FMFutureProperty >> count: aNumber [
	tally := aNumber
]

{ #category : #parsing }
FMFutureProperty >> endAttribute: aString [
	self maybeEnd
]

{ #category : #accessing }
FMFutureProperty >> importer [
	^ self owner importer
]

{ #category : #parsing }
FMFutureProperty >> maybeEnd [
	| property |
	"This makes the parser tolerant so some defects in MSE files."
	tally isZero ifFalse: [ ^ self ].

	property := owner metaDescription
		propertyNamed: name
		ifAbsent: [ owner instance handleFameProperty: name value: values.
			^ self ].

	property setOn: owner instance values: values
]

{ #category : #parsing }
FMFutureProperty >> referenceNumber: serial [
	values add: (self importer index at: serial ifAbsent: [ self importer dangling: (FMDanglingReference with: self) to: serial ])
]

{ #category : #accessing }
FMFutureProperty >> values [
	^ values
]

{ #category : #'initialize-release' }
FMFutureProperty >> with: aFutureElement name: aString [
	super with: aFutureElement name: aString.
	tally := 0.
	name := aString.
	values := OrderedCollection new
]
