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
	#classInstVars : [
		'object',
		'boolean',
		'number',
		'string'
	],
	#category : #'Fame-Core'
}

{ #category : #meta }
FM3Class class >> annotation [
	<MSEClass: #Class super: #FM3Element>
	<package: #FM3>

]

{ #category : #constants }
FM3Class class >> boolean [
	^ boolean
		ifNil: [ boolean := self booleanClass basicNew.
			boolean initialize.
			boolean name: #Boolean.
			"FM3Boolean beImmutable"
			boolean ]
]

{ #category : #'private-anonymous classes' }
FM3Class class >> booleanClass [
	| class |
	class := Class new.
	self setSuperclassClassOf: class.
	class setFormat: self format.
	class methodDict: MethodDictionary new.
	class methodDict at: #isPrimitive put: (self methodNamed: #anonymousReturnTrue).
	class setName: 'AnonymousClass'.
	^ class
]

{ #category : #constants }
FM3Class class >> constantsDo: aBlock [
	aBlock value: self boolean.
	aBlock value: self number.
	aBlock value: self object.
	aBlock value: self string
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

{ #category : #constants }
FM3Class class >> number [
	^ number
		ifNil: [ number := self numberClass basicNew.
			number initialize.
			number name: #Number.
			"FM3Number beImmutable"
			number ]
]

{ #category : #'private-anonymous classes' }
FM3Class class >> numberClass [

	| class |
	class := Class new.
	self setSuperclassClassOf: class.
	class setFormat: self format.
	class methodDict: MethodDictionary new.
	class methodDict at: #isPrimitive put: (self methodNamed: #anonymousReturnTrue).
	class setName: 'AnonymousClass'.
	^class
]

{ #category : #constants }
FM3Class class >> object [
	^ object
		ifNil: [ object := self objectClass basicNew.
			object initialize.
			object superclass: nil.
			object name: #Object.
			"FM3Object beImmutable"
			object ]
]

{ #category : #'private-anonymous classes' }
FM3Class class >> objectClass [

	| class |
	class := Class new.
	self setSuperclassClassOf: class.
	class setFormat: self format.
	class methodDict: MethodDictionary new.
	class methodDict at: #isRoot put: (self  methodNamed: #anonymousReturnTrue).
	class setName: 'AnonymousClass'.
	^class
]

{ #category : #private }
FM3Class class >> privateOnlyCallMeIfYourAreBDFLOrSystemAdminFromHellFlush [
	<script>
	string := number := object := boolean := nil
]

{ #category : #'private-anonymous classes' }
FM3Class class >> setSuperclassClassOf: class [
	"This method is an hack I do to correct a change in Pharo 7 since Moose will soon get a new stable version with the project MooseNG."

	SystemVersion current major < 7
		ifTrue: [ class superclass: self ]
		ifFalse: [ class basicSuperclass: self ]
]

{ #category : #constants }
FM3Class class >> string [
	^ string
		ifNil: [ string := self stringClass basicNew.
			string initialize.
			string name: #String.
			"FM3String beImmutable"
			string ]
]

{ #category : #'private-anonymous classes' }
FM3Class class >> stringClass [

	| class |
	class := Class new.
	self setSuperclassClassOf: class.
	class setFormat: self format.
	class methodDict: MethodDictionary new.
	class methodDict at: #isPrimitive put: (self methodNamed: #anonymousReturnTrue).
	class setName: 'AnonymousClass'.
	^class
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
	nameDict := Dictionary new: 60. "estimated initial size."
	self allPropertiesDo: [ :each |
		nameDict at: each name ifAbsentPut: [ each ]].
	^Array withAll: nameDict values
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

{ #category : #'private-anonymous behaviour' }
FM3Class >> anonymousReturnTrue [
	^true
]

{ #category : #'accessing-query' }
FM3Class >> at: aString [
	aString isSymbol ifTrue: [ self error ].
	^ self propertyNamed: aString
]

{ #category : #'accessing-query' }
FM3Class >> complexProperties [
	^ self properties reject: [ :attr | attr type isPrimitive ]
]

{ #category : #'instance creation' }
FM3Class >> createInstance [
	^ implementingClass ifNil: [ FMRuntimeElement new description: self ] ifNotNil: [ implementingClass new ]
]

{ #category : #private }
FM3Class >> defaultClassName [
	^ (self package name , self name) asSymbol
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
FM3Class >> hasOwner [
	^ self hasPackage
]

{ #category : #testing }
FM3Class >> hasPackage [
	^ package isNotNil
]

{ #category : #testing }
FM3Class >> hasSuperclass [
	^ superclass isNotNil
]

{ #category : #private }
FM3Class >> implementingClass [
	^ implementingClass
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
	superclass := FM3 object.
	FM3 note: 'Not sure if this is valid, maybe, superclass must be nil?'.
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

{ #category : #'accessing-query' }
FM3Class >> isPrimitive [
	<MSEProperty: #primitive type: #Boolean>
	<derived>
	^ false
]

{ #category : #'accessing-query' }
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

{ #category : #accessing }
FM3Class >> packageName [
	^ self package name
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

{ #category : #private }
FM3Class >> setImplementingClass: smalltalkClass [
	implementingClass := smalltalkClass
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
