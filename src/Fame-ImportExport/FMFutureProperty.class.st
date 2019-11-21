"
Description
--------------------

I represent a property of the object currently been imported while it is not yet imported.

I will be useful until all my values are resolved. Each time a value is resolved I'll check if I can be resolved. In that case, I'll push my values in real property.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	parentClass:		<aFMFutureEntity>		The entity owning the property.
	values:			<aCollection>			The values of the property. Those values can contain dangling references while everything is not imported yet.

"
Class {
	#name : #FMFutureProperty,
	#superclass : #FMFuture,
	#instVars : [
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
	^ self parentEntity importer
]

{ #category : #initialization }
FMFutureProperty >> in: aFutureEntity named: aString [
	parentElement := aFutureEntity.
	metaDescription := parentElement metaDescription propertyNamed: aString ifAbsent: [ aString ]
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
		ifTrue: [ metaDescription setOn: parentElement instance values: values ]
		ifFalse: [ parentElement instance handleFameProperty: metaDescription value: values ]
]

{ #category : #accessing }
FMFutureProperty >> numberOfDanglingReferences [
	^ self values count: #isDanglingReference
]

{ #category : #accessing }
FMFutureProperty >> parentEntity [
	^ parentElement
]

{ #category : #parsing }
FMFutureProperty >> referenceNumber: serial [
	self addToValues: (self importer entityAt: serial ifAbsent: [ self importer dangling: (FMDanglingReference with: self) to: serial ])
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
