"
A FM3MetaDescription describes a class in FM3.
It is composed of 
	FM3PropertyDescription which may be a package extension
	
A FM3MetaDescription is contained in a FM3PackageDescription.
	
FM3Property should be managed 

Note that it should be renamed FM3Class to be in sync with the rest of the documents.
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
	#category : #'Fame-Core'
}

{ #category : #meta }
FM3Class class >> annotation [
	<MSEClass: #Class super: #FM3Element>
	<package: #FM3>

]

{ #category : #accessing }
FM3Class class >> defaultSuperclass [
	^ FM3Object instance
]

{ #category : #examples }
FM3Class class >> gtExampleBasic [
	<gtExample>
	^ self new
]

{ #category : #examples }
FM3Class class >> gtExampleWithOnePrimitiveProperty: description [
	<gtExample>
	<depends: #gtExampleBasic>
	^ description properties add: FM3Property new
]

{ #category : #adding }
FM3Class >> addTraits: aCollection [
	self traits addAll: aCollection
]

{ #category : #'accessing-query' }
FM3Class >> allComplexProperties [
	^ self allProperties reject: [ :attr | attr type isPrimitive ]
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
	<MSEProperty: #allProperties type: 'FM3.Property'>
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

{ #category : #ui }
FM3Class >> gtInspectorPropertiesIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: [ self allPrimitiveProperties size asString , ' Properties' translated ];
		display: [ self allPrimitiveProperties ];
		sorted: [ :attribute1 :attribute2 | attribute1 name < attribute2 name ];
		column: 'name'
			evaluated: [ :each | each name ]
			tags: [ :each :aFM3Class | each mmClass ~= aFM3Class ifTrue: [ each mmClass name ] ifFalse: [ OrderedCollection new ] ];
		column: 'type' evaluated: [ :each | each gtTypeString ];
		column: 'derived?' evaluated: [ :each | each isDerived ] width: 50;
		when: [ self allComplexProperties notEmpty ];
		morphicSelectionAct: [ :list | Smalltalk tools browser openOnClass: list selection implementingClass selector: list selection implementingSelector ]
			icon: GLMUIThemeExtraIcons glamorousBrowse
			on: $b
			entitled: 'Browse implementation';
		morphicSelectionAct: [ :list | list selection inspect ] icon: (self iconNamed: #glamorousInspect) entitled: 'Inspect'
]

{ #category : #ui }
FM3Class >> gtInspectorRelationsIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite table 
			title: [ self allComplexProperties size asString , ' Relations' translated ]; 
			display: [ self allComplexProperties ]; sorted: [ :attribute1 :attribute2 | attribute1 name < attribute2 name ]; 
			column: 'name'
			evaluated: [ :each | each name ]
			tags: [ :each :aFM3Class | 
			each mmClass ~= aFM3Class
				ifTrue: [ each mmClass name ]
				ifFalse: [ OrderedCollection new ] ]; column: 'type'
			evaluated: [ :each | each gtTypeString ]; column: 'opposite'
			evaluated: [ :each | each opposite ifNil: [ '' ] ifNotNil: [ :opposite | opposite name ] ]; 
			column: 'derived?'
			evaluated: [ :each | each isDerived ]
			width: 50; column: 'container?' evaluated: [ :each | each isContainer ] width: 50; 
			column: 'isTarget?'
			evaluated: [ :each | each isTarget ]
			width: 50; column: 'isSource?' evaluated: [ :each | each isSource ] width: 50; when: [ self allComplexProperties notEmpty ]; 
			selectionPopulate: #selection
			on: $o
			entitled: 'Open opposite'
			with: [ :list | list selection opposite ]; morphicSelectionAct: [ :list | 
				Smalltalk tools browser
					openOnClass: list selection implementingClass
					selector: list selection implementingSelector ]
			icon: GLMUIThemeExtraIcons glamorousBrowse
			on: $b
			entitled: 'Browse implementation'; morphicSelectionAct: [ :list | list selection inspect ]
			icon: GLMUIThemeExtraIcons glamorousInspect
			on: $i
			entitled: 'Inspect'
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
	<MSEProperty: #abstract type: #Boolean>
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
FM3Class >> isFM3Class [
	^ true
]

{ #category : #testing }
FM3Class >> isPrimitive [
	<MSEProperty: #primitive type: #Boolean>
	<derived>
	^ false
]

{ #category : #testing }
FM3Class >> isRoot [
	<MSEProperty: #root type: #Boolean>
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

{ #category : #'accessing-query' }
FM3Class >> ownerProperty [
	self flag: #FIXME.
	self flag: 'It is possible that several containers exists for a given entity -> we have not a tree, but we should not get cycles at ALL'.
	^self allProperties detect: #isContainer ifNone: [ nil ]
]

{ #category : #accessing }
FM3Class >> package [
	<MSEProperty: #package type: #FM3Package opposite: #classes>
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
	<MSEProperty: #properties type: 'FM3.Property' opposite: #class>
	<multivalued>
	<key: #name>
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
	<MSEProperty: #subclasses type: #FM3Class opposite: #superclass>
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
	<MSEProperty: #superclass type: #FM3Class opposite: #subclasses>
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
	<MSEProperty: #traits type: #FM3Class>
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
