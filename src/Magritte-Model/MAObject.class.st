"
I provide functionality available to all Magritte objects. I implement a dictionary of properties, so that extensions can easily store additional data.
"
Class {
	#name : #MAObject,
	#superclass : #MABasicObject,
	#instVars : [
		'properties'
	],
	#category : #'Magritte-Model-Core'
}

{ #category : #testing }
MAObject class >> isAbstract [
	^ true
]

{ #category : #'instance creation' }
MAObject class >> new [
	"Create a new instance of the receiving class and checks if it is concrete."

	self isAbstract
		ifTrue: [ self error: self name , ' is abstract.' ].
	^ super new
]

{ #category : #reflection }
MAObject class >> withAllConcreteClasses [
	^ Array streamContents: [ :stream |
		self withAllConcreteClassesDo: [ :each |
			stream nextPut: each ] ]
]

{ #category : #reflection }
MAObject class >> withAllConcreteClassesDo: aBlock [
	self withAllSubclassesDo: [ :each |
		each isAbstract ifFalse: [
			aBlock value: each ] ]
]

{ #category : #comparing }
MAObject >> = anObject [
	"Answer whether the receiver and the argument represent the same object. This default implementation checks if the species of the compared objects are the same, so that superclasses might call super before performing their own check. Also redefine the message ==#hash== when redefining this message."

	^ self species = anObject species
]

{ #category : #visiting }
MAObject >> acceptMagritte: aVisitor [
]

{ #category : #private }
MAObject >> errorPropertyNotFound: aSelector [ 
	MAPropertyError signal: 'Property ' , aSelector , ' not found.'
]

{ #category : #testing }
MAObject >> hasProperty: aKey [
	"Test if the property ==aKey== is defined within the receiver."

	^ self properties includesKey: aKey
]

{ #category : #comparing }
MAObject >> hash [
	"Answer a SmallInteger whose value is related to the receiver's identity. Also redefine the message ==#= == when redefining this message."

	^ self species hash
]

{ #category : #copying }
MAObject >> postCopy [
	"This method is called whenever a shallow copy of the receiver is made. Redefine this method in subclasses to copy other fields as necessary. Never forget to call super, else class invariants might be violated."

	super postCopy.
	properties := properties copy
]

{ #category : #accessing }
MAObject >> properties [
	"Answer the property dictionary of the receiver."

	^ properties ifNil: [ properties := Dictionary new ]
]

{ #category : #accessing }
MAObject >> propertyAt: aKey [
	"Answer the value of the property ==aKey==, raises an error if the property doesn't exist."

	^ self propertyAt: aKey ifAbsent: [ self errorPropertyNotFound: aKey ]
]

{ #category : #accessing }
MAObject >> propertyAt: aKey ifAbsent: aBlock [
	"Answer the value of the property ==aKey==, or the result of ==aBlock== if the property doesn't exist."

	^ self properties at: aKey ifAbsent: aBlock
]

{ #category : #accessing }
MAObject >> propertyAt: aKey ifAbsentPut: aBlock [
	"Answer the value of the property ==aKey==, or if the property doesn't exist adds and answers the result of evaluating ==aBlock==."

	^ self properties at: aKey ifAbsentPut: aBlock
]

{ #category : #accessing }
MAObject >> propertyAt: aKey ifPresent: aBlock [
	"Lookup the property ==aKey==, if it is present, answer the value of evaluating ==aBlock== block with the value. Otherwise, answer ==nil==."

	^ self properties at: aKey ifPresent: aBlock
]

{ #category : #accessing }
MAObject >> propertyAt: aKey ifPresent: oneArgBlock ifAbsent: absentBlock [
	"Lookup ==aKey==, if it is present, answer the value of evaluating the oneArgBlock with the value associated with the key, otherwise answer the value of absentBlock."
	^ self properties at: aKey ifPresent: oneArgBlock ifAbsent: absentBlock
]

{ #category : #accessing }
MAObject >> propertyAt: aKey put: aValue [
	"Adds or replaces the property ==aKey== with ==aValue==."

	^ self properties at: aKey put: aValue
]
