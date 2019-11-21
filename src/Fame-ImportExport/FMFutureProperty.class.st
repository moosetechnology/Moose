Class {
	#name : #FMFutureProperty,
	#superclass : #FMFuture,
	#instVars : [
		'name',
		'values',
		'parentElement'
	],
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #adding }
FMFutureProperty >> addToValues: anObject [
	values add: anObject
]

{ #category : #accessing }
FMFutureProperty >> importer [
	^ self parentElement importer
]

{ #category : #initialization }
FMFutureProperty >> in: aFutureElement named: aString [
	parentElement := aFutureElement.
	name := aString
]

{ #category : #initialization }
FMFutureProperty >> initialize [
	super initialize.
	values := OrderedCollection new
]

{ #category : #parsing }
FMFutureProperty >> maybeEnd [
	| property |
	self numberOfDanglingReferences isZero ifFalse: [ ^ self ].

	property := parentElement metaDescription
		propertyNamed: name
		ifAbsent: [ parentElement instance handleFameProperty: name value: values.
			^ self ].

	property setOn: parentElement instance values: values
]

{ #category : #accessing }
FMFutureProperty >> numberOfDanglingReferences [
	^ self values count: #isDanglingReference
]

{ #category : #accessing }
FMFutureProperty >> parentElement [
	^ parentElement
]

{ #category : #parsing }
FMFutureProperty >> referenceNumber: serial [
	self addToValues: (self importer elementAt: serial ifAbsent: [ self importer dangling: (FMDanglingReference with: self) to: serial ])
]

{ #category : #parsing }
FMFutureProperty >> replaceDanglingReferenceAt: anInteger by: anElement [
	self values at: anInteger put: anElement.
	self maybeEnd
]

{ #category : #accessing }
FMFutureProperty >> values [
	^ values
]
