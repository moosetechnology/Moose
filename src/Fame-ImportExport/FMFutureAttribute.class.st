Class {
	#name : #FMFutureAttribute,
	#superclass : #FMFuture,
	#instVars : [
		'name',
		'values',
		'tally'
	],
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #'instance creation' }
FMFutureAttribute class >> with: anImporter name: aString [

	^self new with: anImporter name: aString
]

{ #category : #accessing }
FMFutureAttribute >> count [
	^ tally
]

{ #category : #accessing }
FMFutureAttribute >> count: aNumber [
	tally := aNumber
]

{ #category : #parsing }
FMFutureAttribute >> endAttribute: aString [
	self maybeEnd
]

{ #category : #accessing }
FMFutureAttribute >> importer [
	^ self owner importer
]

{ #category : #parsing }
FMFutureAttribute >> maybeEnd [
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
FMFutureAttribute >> referenceNumber: serial [
	values add: (self importer index at: serial ifAbsent: [ self importer dangling: (FMDanglingReference with: self) to: serial ])
]

{ #category : #accessing }
FMFutureAttribute >> values [
	^ values
]

{ #category : #'initialize-release' }
FMFutureAttribute >> with: aFutureElement name: aString [
	super with: aFutureElement name: aString.
	tally := 0.
	name := aString.
	values := OrderedCollection new
]
