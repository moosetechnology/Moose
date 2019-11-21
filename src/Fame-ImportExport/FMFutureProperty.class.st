Class {
	#name : #FMFutureProperty,
	#superclass : #FMFuture,
	#instVars : [
		'values',
		'parentClass'
	],
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #adding }
FMFutureProperty >> addToValues: anObject [
	values add: anObject
]

{ #category : #accessing }
FMFutureProperty >> importer [
	^ self parentClass importer
]

{ #category : #initialization }
FMFutureProperty >> in: aFutureElement named: aString [
	parentClass := aFutureElement.
	metaDescription := parentClass metaDescription propertyNamed: aString ifAbsent: [ aString ]
]

{ #category : #initialization }
FMFutureProperty >> initialize [
	super initialize.
	values := OrderedCollection new
]

{ #category : #parsing }
FMFutureProperty >> maybeEnd [
	"If the property still has dangling references we cannot end it."
	self numberOfDanglingReferences isZero ifFalse: [ ^ self ].

	"If the MM does not contains the property, we use the name of the property to let a chance to some entities to manage missing properties."
	metaDescription isFM3Property
		ifTrue: [ metaDescription setOn: parentClass instance values: values ]
		ifFalse: [ parentClass instance handleFameProperty: metaDescription value: values ]
]

{ #category : #accessing }
FMFutureProperty >> numberOfDanglingReferences [
	^ self values count: #isDanglingReference
]

{ #category : #accessing }
FMFutureProperty >> parentClass [
	^ parentClass
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
