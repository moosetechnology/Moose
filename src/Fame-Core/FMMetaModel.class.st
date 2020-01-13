"
Description
--------------------

I am a model containing meta-description of a FMModel. I contain instances of FM3Element.

For example, in the Smalltalk metamodel of Famix, if we want to represent the Point class we will have:
- A FMModel containing an instance of FamixStClass representing the Point class.
- A FMMetaModel containing instances of FM3Elements describing FamixStClass.
- A FMMetaMetaModel containing instances of FM3Element describing FM3 meta model (Package, Class and Property).

I will probably not be created by hand but either via:
- A FMMetaModelBuilder that will use pragmas and slots from real Pharo classes to build the meta model.
- An import of a serialized meta model.

Examples
--------------------

	FMMetaModel fromString: FMMSEParserTest famix30mse.
	
	FMMetaModelBuilder metamodelFrom: {RPGDragon . RPGTreasure . RPGHero}.
 
Internal Representation and Key Implementation Points.
--------------------

	I am using some caches to speed up the way to find a description of a class.

    Instance Variables
	classDict:		<aDictionary>		I am a cache linking a real class to its description.
	nameDict:			<aDictionary>		I am a cache linking an element name to its description.

"
Class {
	#name : #FMMetaModel,
	#superclass : #FMModel,
	#instVars : [
		'classDict',
		'nameDict'
	],
	#category : #'Fame-Core-Models'
}

{ #category : #accessing }
FMMetaModel >> allImplementingClasses [
	^ self classes collect: #implementingClass
]

{ #category : #accessing }
FMMetaModel >> classes [
	^ self elements select: [ :each | each isFM3Class ]
]

{ #category : #accessing }
FMMetaModel >> concreteImplementingClasses [
	"Return all the real classes that are a class and not a trait."

	^ self allImplementingClasses reject: #isTrait
]

{ #category : #initialization }
FMMetaModel >> defaultMetamodel [
	^ FMMetaMetaModel default
]

{ #category : #accessing }
FMMetaModel >> descriptionOf: smalltalkClass [
	^ self descriptionOf: smalltalkClass ifAbsent: [ NotFound signalFor: smalltalkClass in: self ]
]

{ #category : #accessing }
FMMetaModel >> descriptionOf: smalltalkClass ifAbsent: elseBlock [
	^ classDict at: smalltalkClass ifAbsent: elseBlock
]

{ #category : #accessing }
FMMetaModel >> descriptionOf: smalltalkClass ifPresent: aBlock ifAbsent: elseBlock [
	^ classDict at: smalltalkClass ifPresent: aBlock ifAbsent: elseBlock
]

{ #category : #accessing }
FMMetaModel >> elementNamed: aString [
	^ self elementNamed: aString ifAbsent: [ self error: 'Element ''' , aString , ''' not found.' ]
]

{ #category : #accessing }
FMMetaModel >> elementNamed: aString ifAbsent: exceptionBlock [
	^ nameDict at: aString ifAbsent: exceptionBlock
]

{ #category : #testing }
FMMetaModel >> includes: element [
	"Here we use the elements inst var instead of the getter to not cast the elements as array. It improve the perf a lot."

	^ (element isFM3Class and: [ element isBuiltIn ]) or: [ elements includes: element ]
]

{ #category : #initialization }
FMMetaModel >> initialize [
	super initialize.
	self updateCache
]

{ #category : #testing }
FMMetaModel >> isMetamodel [
	^ true
]

{ #category : #accessing }
FMMetaModel >> packageNamed: name [
	^ nameDict at: name
]

{ #category : #accessing }
FMMetaModel >> packageNamed: name ifAbsentPut: aBlock [
	^ nameDict at: name ifAbsentPut: aBlock
]

{ #category : #accessing }
FMMetaModel >> packages [
	^ self elements select: [ :each | each isFM3Package ]
]

{ #category : #private }
FMMetaModel >> postAdd: element [
	self updateCacheWith: element
]

{ #category : #accessing }
FMMetaModel >> properties [
	^ self elements select: [ :each | each isFM3Property ]
]

{ #category : #private }
FMMetaModel >> updateCache [
	nameDict := (FM3Constant constants collect: [ :const | const name asString -> const ]) asDictionary.
	classDict := (FM3Constant constants collect: [ :const | const class -> const ]) asDictionary.
	self elements do: [ :each | self updateCacheWith: each ]
]

{ #category : #private }
FMMetaModel >> updateCacheWith: element [
	element fullName ifNotNil: [ :fullName | nameDict at: fullName put: element ].
	element isFM3Class ifTrue: [ element implementingClass ifNotNil: [ :class | classDict at: class put: element ] ]
]
