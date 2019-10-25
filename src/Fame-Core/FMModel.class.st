"
A FMRepository is a model: a group of instances of FM3Elements.
A FMMetaRepository is a group of FM3Elements. 

Note that FMRepository is not part of the FM3 model. It is more an implementation class. 

As an example when loading the Java class Point in mse format.

The repository contains an instance of the FAMIXClass representing the Java Point class. 
The metaRepository contains instances of FM3Element describing FAMIXClass. 
The metaMetaRepository contains instances describing the FM3Element class.


-----

A FMRepository knows its metaRepository instance of FM3MetaRepository

We can add, search, import export the model elements. 

We can get the description of an element using the method metaDescriptionOf:


To create a repository we can import it from a stream using importStream:.

You can also use a kind of DSL to describe your model. Have a look at document: senders. 



"
Class {
	#name : #FMModel,
	#superclass : #Object,
	#instVars : [
		'elements',
		'metamodel',
		'additionalProperties'
	],
	#category : #'Fame-Core-Models'
}

{ #category : #'instance creation' }
FMModel class >> withMetamodel: aMetamodel [
	^ self new
		metamodel: aMetamodel;
		yourself
]

{ #category : #visiting }
FMModel >> accept: aVisitor [
	aVisitor visitModel: self
]

{ #category : #adding }
FMModel >> add: element [
	elements add: element.
	self postAdd: element
]

{ #category : #adding }
FMModel >> addAll: elementCollection [
	elementCollection do: [ :each | self add: each ]
]

{ #category : #accessing }
FMModel >> additionalProperties [
	^ additionalProperties ifNil: [ additionalProperties := IdentityDictionary new ]
]

{ #category : #accessing }
FMModel >> additionalPropertiesFor: entityClass [
	^ self additionalProperties at: entityClass ifAbsentPut: [ IdentityDictionary new ]
]

{ #category : #accessing }
FMModel >> additionalProperty: aSymbol for: entityClass [
	^ (self additionalPropertiesFor: entityClass) at: aSymbol
]

{ #category : #accessing }
FMModel >> additionalProperty: aSymbol for: entityClass ifAbsentPut: aBlock [
	^ (self additionalPropertiesFor: entityClass) at: aSymbol ifAbsentPut: aBlock
]

{ #category : #accessing }
FMModel >> additionalProperty: aSymbol for: entityClass put: anObject [
	^ (self additionalPropertiesFor: entityClass) at: aSymbol put: anObject
]

{ #category : #accessing }
FMModel >> cleanAdditionalProperties [
	additionalProperties := IdentityDictionary new
]

{ #category : #private }
FMModel >> coerceProperty: propertyOrName receiver: receiver [
	propertyOrName isFM3Property ifTrue: [ ^ propertyOrName ].
	propertyOrName isString ifTrue: [ ^ (self metaDescriptionOf: receiver) propertyNamed: propertyOrName ].
	self error
]

{ #category : #'accessing-meta' }
FMModel >> containerOf: element [
	^ (self metaDescriptionOf: element)
		ifNil: [ nil ]
		ifNotNil: [ :meta |
			meta ownerProperty
				ifNil: [ nil ]
				ifNotNil: [ :property | self get: property element: element ] ]
]

{ #category : #initialization }
FMModel >> defaultMetamodel [
	^ FMMetaModel new
]

{ #category : #accessing }
FMModel >> elements [
	^ elements asArray
]

{ #category : #'accessing-meta' }
FMModel >> get: propertyOrName element: element [
	^ (self coerceProperty: propertyOrName receiver: element) getFrom: element
]

{ #category : #testing }
FMModel >> includes: element [
	"Do not use the getter here to not cast the elements as array. Important for performances."

	^ elements includes: element
]

{ #category : #initialization }
FMModel >> initialize [
	super initialize.
	elements := IdentitySet new
]

{ #category : #testing }
FMModel >> isEmpty [
	^ elements isEmpty
]

{ #category : #testing }
FMModel >> isMetaMetamodel [
	^ false
]

{ #category : #testing }
FMModel >> isMetamodel [
	^ false
]

{ #category : #testing }
FMModel >> isNotEmpty [
	^ self isEmpty not
]

{ #category : #'accessing-meta' }
FMModel >> metaDescriptionOf: element [
	^ element metaDescriptionIn: self metamodel
]

{ #category : #accessing }
FMModel >> metaMetaModel [
	^ self metamodel metamodel
]

{ #category : #accessing }
FMModel >> metamodel [
	^ metamodel ifNil: [ metamodel := self defaultMetamodel ]
]

{ #category : #accessing }
FMModel >> metamodel: aMetamodel [
	metamodel := aMetamodel
]

{ #category : #private }
FMModel >> postAdd: element [
	"do nothing"
]

{ #category : #removing }
FMModel >> remove: element [
	elements remove: element ifAbsent: [  ]
]

{ #category : #removing }
FMModel >> removeAll: elementCollection [
	elementCollection do: [ :each | self remove: each ]
]

{ #category : #'accessing-meta' }
FMModel >> set: propertyOrName element: element values: values [
	^ (self coerceProperty: propertyOrName receiver: element) setOn: element values: values
]

{ #category : #accessing }
FMModel >> size [
	^ self elements size
]

{ #category : #private }
FMModel >> updateCache [
]
