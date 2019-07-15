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
	self postAdd: element.
]

{ #category : #adding }
FMRepository >> addAll: elementCollection [
	
	elementCollection do: [ :each |
		self add: each ]
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

	propertyOrName isFM3Property ifTrue: [ ^propertyOrName ].
	propertyOrName isString ifTrue: [
		^(self metaDescriptionOf: receiver) at: propertyOrName ].
	self error.
	

]

{ #category : #adding }
FMRepository >> compositeAdd: element [
	
	| meta |
	elements add: element.
	meta := self metaDescriptionOf: element.
	meta allAttributes do: [ :attr |
		(attr type isPrimitive not and: [ attr isComposite ]) ifTrue: [
			| values |
			values := self get: attr element: element.
			values do: [ :value |
				(self includes: value) ifFalse: [
					self deepAdd: value ]]]].
	self postAdd: element.
]

{ #category : #removing }
FMRepository >> compositeDelete: element [
	"Remove element and all its children (see FM3Property#container) from the model.
	References by other elements to element and all its children are removed as well."
	FM3 todo

]

{ #category : #removing }
FMRepository >> compositeRemove: element [
	
	| meta |

	self remove: element.
	meta := self metaDescriptionOf: element.
	meta allAttributes do: [ :attr |
		(attr type isPrimitive not and: [ attr isComposite ]) ifTrue: [
			| values |
			values := self get: attr element: element.
			values do: [ :value |
				(self includes: value) ifTrue: [
					self deepRemove: value ]]]].
	self postRemove: element.
]

{ #category : #'accessing-meta' }
FMRepository >> containerOf: element [ 
	| meta property |
	meta := self metaDescriptionOf: element.
	meta ifNotNil: [
		property := meta ownerAttribute.
		property ifNil: [ ^ nil ].
		^ self 
			get: property
			element: element ].
	^ nil
]

{ #category : #adding }
FMRepository >> createElementWithType: aString [

	| element |
	element := metamodel createInstanceOf: aString.
	self add: element.
	^ element

]

{ #category : #adding }
FMRepository >> deepAdd: element [
	
	| meta |
	elements add: element.
	meta := self metaDescriptionOf: element.
	meta allAttributes do: [ :attr |
		attr type isPrimitive not ifTrue: [
			| values |
			values := self get: attr element: element.
			values do: [ :value |
				(self includes: value) ifFalse: [
					self deepAdd: value ]]]].
	self postAdd: element.
]

{ #category : #removing }
FMRepository >> deepRemove: element [
	
	| meta |
	self remove: element.
	meta := self metaDescriptionOf: element.
	meta allAttributes do: [ :attr |
		attr type isPrimitive ifFalse: [
			| values |
			values := self get: attr element: element.
			values do: [ :value |
				(self includes: value) ifTrue: [
					self deepRemove: value ]]]].
	self postRemove: element.
]

{ #category : #accessing }
FMRepository >> elements [
	^elements asArray
]

{ #category : #'accessing-meta' }
FMRepository >> get: propertyOrName element: element [ 

	^(self coerceProperty: propertyOrName receiver: element) getFrom: element
]

{ #category : #testing }
FMRepository >> includes: element [
	"Do not use the getter here to not cast the elements as array. Important for performances."

	^ elements includes: element
]

{ #category : #'initialize-release' }
FMRepository >> initialize [

	elements := IdentitySet new.

]

{ #category : #'initialize-release' }
FMRepository >> initialize: aMetamodel [

	self initialize.
	metamodel := aMetamodel.
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

{ #category : #private }
FMRepository >> postRemove: element [

	"do nothing"
]

{ #category : #removing }
FMRepository >> remove: element [

	elements remove: element ifAbsent: [].
	self postRemove: element.
]

{ #category : #removing }
FMRepository >> removeAll: elementCollection [

	elementCollection do: [
		:each |
		self remove: each.
	]

	"elements removeAll: elementCollection (without postRemove)"
]

{ #category : #enumerating }
FMRepository >> selectKindOf: smalltalkOrFameClass [

	^smalltalkOrFameClass isBehavior 
		ifTrue: [ self elements select: [ :each | each isKindOf: smalltalkOrFameClass ] ]
		ifFalse: [ self elements select: [ :each | (self metaDescriptionOf: each) = smalltalkOrFameClass ] ]
]

{ #category : #'accessing-meta' }
FMRepository >> set: propertyOrName element: element values: values [ 
	
	^(self coerceProperty: propertyOrName receiver: element) setOn: element values: values 
]

{ #category : #accessing }
FMRepository >> size [

	^self elements size
]

{ #category : #private }
FMRepository >> updateCache [
]
