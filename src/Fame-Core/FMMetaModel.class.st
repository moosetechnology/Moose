"
A FMMetaRepository is a repository containing descriptions of the classes used in a repository.

So an FM3Repository contains instances (ie instance of FamixClass or RPGHero)
and its associated FMMetaRepository contains instance of describing the classes of the 
FM3Repository elements.

Instance Variables
	classDict:		<Object>
	nameDict:		<Object>
	packageDict:		<Object>

classDict
	- Smalltalk class to its description

nameDict
	- Primitive object names to their description instance

packageDict
	- Package names to their description instance

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
	^ FMMetaMetaModel new
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
