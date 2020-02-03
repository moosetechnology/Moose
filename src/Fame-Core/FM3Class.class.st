"
Description
--------------------

I represent class in a fame meta-model.

I should be contained in a FM3Package and I can be stored in a FMMetaModel.
I contain instances of FM3Property which might be package extensions or not.
I can have a superclass, subclasses and traits which are all FM3Class instances. While doing the lookup of my properties, I will take my superclasses and traits into account.

Some Fame classes are constants that will be used in all metamodels. You can find more informations about them in FM3Constant.

Public API and Key Messages
--------------------

- #properties 			Return the local properties of the class.
- #allProperties 		Return all the properties of the class. This includes the properties of my superclasses and my traits.
	
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	implementingClass:		<anObject>			Real class I am describing. This can either be a real object or a FMRuntimeElement in case we do not know my real entity.
	isAbstract:				<aBoolean>			Define if the class is abstract or not.
	package:					<aFM3Package>		FM3Package containing the class.
	properties:				<aCollection>		A collection of the FM3Properties defined locally in the class. (Does not includes the properties of traits and superclasses)
	subclasses:				<aCollection>		A collection of my subclasses which are intances of FM3Class.
	superclass:				<aFM3Class>			My FM3Class superclass. In case there is no superclass to define, I'll point to the FM3Object default instance representing the root of all classes.
	traits:					<aCollection>		A collection of FM3Class representing the traits I am using.
"
Class {
	#name : #FM3Class,
	#superclass : #FM3Element,
	#instVars : [
		'isAbstract',
		'superclass',
		'package',
		'implementingClass',
		'subclasses',
		'traits',
		'properties'
	],
	#category : #'Fame-Core-Model'
}

{ #category : #meta }
FM3Class class >> annotation [
	<FMClass: #Class super: #FM3Element>
	<package: #FM3>

]

{ #category : #accessing }
FM3Class class >> defaultSuperclass [
	^ FM3Object instance
]

{ #category : #visiting }
FM3Class >> accept: aVisitor [
	aVisitor visitClass: self
]

{ #category : #adding }
FM3Class >> addTraits: aCollection [
	self traits addAll: aCollection
]

{ #category : #'accessing-query' }
FM3Class >> allComplexProperties [
	^ self allProperties reject: [ :attr | attr type isNotNil and: [ attr type isPrimitive ] ]
]

{ #category : #'accessing-query' }
FM3Class >> allContainerProperties [
	^ self allProperties select: #isContainer
]

{ #category : #'accessing-query' }
FM3Class >> allPrimitiveProperties [
	^ self allProperties select: [ :attr | attr type isNotNil and: [ attr type isPrimitive ] ]
]

{ #category : #'accessing-query' }
FM3Class >> allProperties [
	<FMProperty: #allProperties type: 'FM3.Property'>
	<multivalued>
	<derived>
	| nameDict |
	nameDict := Dictionary new: 60.	"estimated initial size."
	self allPropertiesDo: [ :each | nameDict at: each name ifAbsentPut: [ each ] ].
	^ nameDict values asArray
]

{ #category : #enumerating }
FM3Class >> allPropertiesDo: block [
	properties do: block.
	self superclass ifNotNil: [ :class | class allPropertiesDo: block ].
	self traits do: [ :trait | trait allPropertiesDo: block ]
]

{ #category : #accessing }
FM3Class >> allSubclasses [
	| all |
	all := OrderedCollection new.
	self allSubclassesDo: [ :each | all add: each ].
	^ all
]

{ #category : #accessing }
FM3Class >> allSubclassesDo: aBlock [
	self subclasses
		do: [ :each | 
			aBlock value: each.
			each allSubclassesDo: aBlock ]
]

{ #category : #accessing }
FM3Class >> allSuperclasses [
	| mmclass superclasses |
	superclasses := OrderedCollection new.
	mmclass := self.

	[ mmclass hasSuperclass ]
		whileTrue: [ mmclass := mmclass superclass.
			superclasses add: mmclass ].
	^ superclasses
]

{ #category : #accessing }
FM3Class >> allSuperclassesDo: aBlock [
	self allSuperclasses do: [ :each | aBlock value: each ]
]

{ #category : #'accessing-query' }
FM3Class >> complexProperties [
	^ self properties reject: [ :attr | attr type isPrimitive ]
]

{ #category : #'instance creation' }
FM3Class >> createInstance [
	^ implementingClass
		ifNil: [ FMRuntimeElement new description: self ]
		ifNotNil: [ implementingClass new ]
]

{ #category : #testing }
FM3Class >> hasPackage [
	^ package isNotNil
]

{ #category : #testing }
FM3Class >> hasSuperclass [
	^ superclass isNotNil
]

{ #category : #accessing }
FM3Class >> implementingClass [
	^ implementingClass
]

{ #category : #accessing }
FM3Class >> implementingClass: smalltalkClass [
	implementingClass := smalltalkClass
]

{ #category : #accessing }
FM3Class >> inheritsFrom: aClass [
	self allSuperclassesDo: [ :each | each = aClass ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #initialization }
FM3Class >> initialize [
	super initialize.
	properties := FMMultivalueLink on: self opposite: #mmClass:.
	isAbstract := false.
	superclass := self class defaultSuperclass.
	subclasses := FMMultivalueLink on: self opposite: #superclass:.
	traits := Set new
]

{ #category : #accessing }
FM3Class >> isAbstract [
	<FMProperty: #abstract type: #Boolean>
	^ isAbstract
]

{ #category : #accessing }
FM3Class >> isAbstract: aBoolean [
	isAbstract := aBoolean
]

{ #category : #testing }
FM3Class >> isBuiltIn [
	^ self isPrimitive or: [ self isRoot ]
]

{ #category : #testing }
FM3Class >> isConstant [
	^ false
]

{ #category : #testing }
FM3Class >> isFM3Class [
	^ true
]

{ #category : #testing }
FM3Class >> isPrimitive [
	<FMProperty: #primitive type: #Boolean>
	<derived>
	^ false
]

{ #category : #testing }
FM3Class >> isRoot [
	<FMProperty: #root type: #Boolean>
	<derived>
	^ false
]

{ #category : #accessing }
FM3Class >> owner [
	^ self package
]

{ #category : #'accessing-query' }
FM3Class >> ownerProperties [
	^ self allProperties select: #isContainer
]

{ #category : #accessing }
FM3Class >> package [
	<FMProperty: #package type: #FM3Package opposite: #classes>
	<container>
	^ package
]

{ #category : #accessing }
FM3Class >> package: newPackage [
	package := FMMultivalueLink
		on: self
		update: #classes
		from: self package
		to: newPackage
]

{ #category : #'accessing-query' }
FM3Class >> primitiveProperties [
	^ self properties select: [ :attr | attr type isPrimitive ]
]

{ #category : #accessing }
FM3Class >> properties [
	<FMProperty: #properties type: 'FM3.Property' opposite: #class>
	<multivalued>
	^ properties
]

{ #category : #accessing }
FM3Class >> properties: anObject [
	properties value: anObject
]

{ #category : #'accessing-query' }
FM3Class >> propertiesNamed: aListOfSymbol [
	^ aListOfSymbol collect: [ :each | self propertyNamed: each ]
]

{ #category : #'accessing-query' }
FM3Class >> propertyNamed: aString [
	^ self propertyNamed: aString ifAbsent: nil
]

{ #category : #'accessing-query' }
FM3Class >> propertyNamed: aString ifAbsent: aBlock [
	self allPropertiesDo: [ :attr | attr name = aString ifTrue: [ ^ attr ] ].

	^ aBlock value
]

{ #category : #accessing }
FM3Class >> subclasses [ 
	<FMProperty: #subclasses type: #FM3Class opposite: #superclass>
	<derived>
	<multivalued>
	^subclasses
]

{ #category : #accessing }
FM3Class >> subclasses: anObject [
	subclasses value: anObject
]

{ #category : #accessing }
FM3Class >> superclass [
	<FMProperty: #superclass type: #FM3Class opposite: #subclasses>
	^ superclass
]

{ #category : #accessing }
FM3Class >> superclass: newClass [
	superclass := FMMultivalueLink
		on: self
		update: #subclasses
		from: self superclass
		to: newClass
]

{ #category : #accessing }
FM3Class >> traits [
	<FMProperty: #traits type: #FM3Class>
	<multivalued>
	^ traits
]

{ #category : #accessing }
FM3Class >> withAllSubclasses [
	^ self allSubclasses
		add: self;
		yourself
]

{ #category : #accessing }
FM3Class >> withAllSuperclasses [
	^ self allSuperclasses
		add: self;
		yourself
]
