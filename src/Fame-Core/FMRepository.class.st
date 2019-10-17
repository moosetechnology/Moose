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
	#name : #FMRepository,
	#superclass : #Object,
	#instVars : [
		'elements',
		'metamodel',
		'additionalProperties'
	],
	#category : #'Fame-Core'
}

{ #category : #'instance creation' }
FMRepository class >> new [

	self shouldNotImplement
]

{ #category : #'instance creation' }
FMRepository class >> with: aMetamodel [

	^self basicNew initialize: aMetamodel
]

{ #category : #adding }
FMRepository >> add: element [
	elements add: element.
	self postAdd: element
]

{ #category : #adding }
FMRepository >> addAll: elementCollection [
	elementCollection do: [ :each | self add: each ]
]

{ #category : #accessing }
FMRepository >> additionalProperties [
	^ additionalProperties ifNil: [ additionalProperties := IdentityDictionary new ]
]

{ #category : #accessing }
FMRepository >> additionalPropertiesFor: entityClass [
	^ self additionalProperties at: entityClass ifAbsentPut: [ IdentityDictionary new ]
]

{ #category : #accessing }
FMRepository >> additionalProperty: aSymbol for: entityClass [
	^ (self additionalPropertiesFor: entityClass) at: aSymbol
]

{ #category : #accessing }
FMRepository >> additionalProperty: aSymbol for: entityClass ifAbsentPut: aBlock [
	^ (self additionalPropertiesFor: entityClass) at: aSymbol ifAbsentPut: aBlock
]

{ #category : #accessing }
FMRepository >> additionalProperty: aSymbol for: entityClass put: anObject [
	^ (self additionalPropertiesFor: entityClass) at: aSymbol put: anObject
]

{ #category : #accessing }
FMRepository >> cleanAdditionalProperties [
	additionalProperties := IdentityDictionary new
]

{ #category : #private }
FMRepository >> coerceProperty: propertyOrName receiver: receiver [
	propertyOrName isFM3Property ifTrue: [ ^ propertyOrName ].
	propertyOrName isString ifTrue: [ ^ (self metaDescriptionOf: receiver) at: propertyOrName ].
	self error
]

{ #category : #'accessing-meta' }
FMRepository >> containerOf: element [
	^ (self metaDescriptionOf: element)
		ifNil: [ nil ]
		ifNotNil: [ :meta |
			meta ownerProperty
				ifNil: [ nil ]
				ifNotNil: [ :property | self get: property element: element ] ]
]

{ #category : #adding }
FMRepository >> deepAdd: element [
	elements add: element.
	(self metaDescriptionOf: element) allComplexProperties
		do: [ :attr |
			(self get: attr element: element)
				reject: [ :value | self includes: value ]
				thenDo: [ :value | self deepAdd: value ] ].
	self postAdd: element
]

{ #category : #removing }
FMRepository >> deepRemove: element [
	self remove: element.
	(self metaDescriptionOf: element) allComplexProperties
		do: [ :attr |
			(self get: attr element: element)
				select: [ :value | self includes: value ]
				thenDo: [ :value | self deepRemove: value ] ]
]

{ #category : #accessing }
FMRepository >> elements [
	^ elements asArray
]

{ #category : #'accessing-meta' }
FMRepository >> get: propertyOrName element: element [
	^ (self coerceProperty: propertyOrName receiver: element) getFrom: element
]

{ #category : #testing }
FMRepository >> includes: element [
	"Do not use the getter here to not cast the elements as array. Important for performances."

	^ elements includes: element
]

{ #category : #initialization }
FMRepository >> initialize [
	super initialize.
	elements := IdentitySet new
]

{ #category : #'initialize-release' }
FMRepository >> initialize: aMetamodel [
	self initialize.
	metamodel := aMetamodel
]

{ #category : #testing }
FMRepository >> isEmpty [

	^elements isEmpty
]

{ #category : #testing }
FMRepository >> isMetaMetamodel [
	^false
]

{ #category : #testing }
FMRepository >> isMetamodel [
	^false
]

{ #category : #'accessing-meta' }
FMRepository >> metaDescriptionOf: element [ 

	^(element isKindOf: FMRuntimeElement) 
		ifTrue: [ element description ]
		ifFalse: [ metamodel descriptionOf: element class ]
]

{ #category : #accessing }
FMRepository >> metamodel [
	^metamodel
]

{ #category : #private }
FMRepository >> postAdd: element [
	"do nothing"
]

{ #category : #removing }
FMRepository >> remove: element [
	elements remove: element ifAbsent: [  ]
]

{ #category : #removing }
FMRepository >> removeAll: elementCollection [
	elementCollection do: [ :each | self remove: each ]
]

{ #category : #'accessing-meta' }
FMRepository >> set: propertyOrName element: element values: values [
	^ (self coerceProperty: propertyOrName receiver: element) setOn: element values: values
]

{ #category : #accessing }
FMRepository >> size [
	^ self elements size
]

{ #category : #private }
FMRepository >> updateCache [
]
