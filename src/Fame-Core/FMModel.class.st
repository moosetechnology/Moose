"
Description
--------------------

I am a model used in the scope of Fame.

I contains real instances of a class representing a concept in the current metamodel. This class is described by an entity of my meta-model. 

I have a meta-model containing descriptions of my content. A FMModel has a FMMetaModel as meta-model which has a FMMetaMetaModel has metamodel. 

For example, in the Smalltalk metamodel of Famix, if we want to represent the Point class we will have:
- A FMModel containing an instance of FamixStClass representing the Point class.
- A FMMetaModel containing instances of FM3Elements describing FamixStClass.
- A FMMetaMetaModel containing instances of FM3Element describing FM3 meta model (Package, Class and Property).

I include a system of caches in case my users want to store informations to speed up an application.

I will initialize myself with a new FMMetaModel but this one can be replaced by an existing one.

Public API and Key Messages
--------------------

- #metaDescriptionOn: 		Allows one to get the meta-description of an element.

Examples
--------------------
	
	| model |
	model := FMModel new.
	model metamodel importString: FMHeinekenExample metamodelMSE.
	model.


	model := (FMModel withMetamodel: (FMMetaModel fromString: FMHeinekenExample metamodelMSE)).
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	additionalProperties:		<aDictionary>		A cache used to store some informations about the model.
	elements:						<aCollection>		All the entities of the model.
	metamodel:					<aFMMetaModel>		The meta-model describing my entities.

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

{ #category : #testing }
FMModel >> classIsRoot: element [
	^ (self containersOf: element) isEmpty
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
FMModel >> containersOf: element [
	^ (self metaDescriptionOf: element)
		ifNil: [ #() ]
		ifNotNil: [ :meta | meta ownerProperties flatCollectAsSet: [ :property | self get: property element: element ] ]
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
