"
A FM3PropertyDescription is a fame property (attribute)

Instance Variables
	class:		<Object>
	implementingSelector:		<Object>
	isContainer:		<Object>
	isDerived:		<Object>
	isMultivalued:		<Object>
	key:		<Object>
	opposite:		<Object>
	package:		<Object>
	type:		<Object>

"
Class {
	#name : #FM3PropertyDescription,
	#superclass : #FM3Element,
	#instVars : [
		'isContainer',
		'isDerived',
		'isMultivalued',
		'opposite',
		'class',
		'package',
		'type',
		'key',
		'implementingSelector',
		'isTarget',
		'isSource'
	],
	#category : #'Fame-Core'
}

{ #category : #meta }
FM3PropertyDescription class >> annotation [
	<MSEClass: #Property super: #FM3Element>
	<package: #FM3>

]

{ #category : #example }
FM3PropertyDescription class >> gtExampleBasic [
	<gtExample>
	^ self new
]

{ #category : #'accessing-query' }
FM3PropertyDescription >> compiledMethod [

	^ self mmClass 
		ifNotNil: [ :aClass | aClass implementingClass methodNamed: self implementingSelector ]
		ifNil: [ ^ nil ].


	
]

{ #category : #'accessing-meta' }
FM3PropertyDescription >> getFrom: element [
	"This method is meant to be used by the repository"

	| result |
	result := element mmGetProperty: self.
	^ self isMultivalued
		ifTrue: [ result ]
		ifFalse: [ result ifNil: [ Array new ] ifNotNil: [ Array with: result ] ]
]

{ #category : #'accessing-meta' }
FM3PropertyDescription >> getRawFrom: element [
	"This is internal logic for retrieving the actual value of a property from an element.
	By default call the implementing selector."

	^ element perform: self implementingSelector
]

{ #category : #ui }
FM3PropertyDescription >> gtDisplayOn: stream [
	stream 
		nextPutAll: self fullName
]

{ #category : #ui }
FM3PropertyDescription >> gtInspectorSourceIn: composite [
	<gtInspectorPresentationOrder: 0>
	self hasImplementingSelector ifTrue: [
		self compiledMethod ifNotNil: [ :c | c asRingDefinition gtInspectorSourceIn: composite ] ]
]

{ #category : #ui }
FM3PropertyDescription >> gtTypeString [
	^ String streamContents: [ :s | 
		s nextPutAll: self type name. 
		self isMultivalued ifTrue: [ s nextPutAll: ' *'].
		self isDerived ifTrue: [ s nextPutAll: ' /'] ]
]

{ #category : #testing }
FM3PropertyDescription >> hasImplementingSelector [
	^ self implementingSelector notNil
]

{ #category : #testing }
FM3PropertyDescription >> hasKey [
	^ key isNil not
]

{ #category : #testing }
FM3PropertyDescription >> hasMmClass [
	^class notNil
]

{ #category : #'accessing-query' }
FM3PropertyDescription >> hasOpposite [
	^opposite notNil
]

{ #category : #testing }
FM3PropertyDescription >> hasOwner [
	^ self hasMmClass
]

{ #category : #accessing }
FM3PropertyDescription >> implementingSelector [
	^ implementingSelector
]

{ #category : #initialization }
FM3PropertyDescription >> initialize [

	isContainer := false.
	isDerived := false.
	isMultivalued := false.
	isSource := false.
	isTarget := false.
	package := nil.
	class := nil.
	opposite := nil.
]

{ #category : #testing }
FM3PropertyDescription >> isChildrenProperty [
	^ self hasOpposite and: [ self opposite isContainer ]
]

{ #category : #'accessing-query' }
FM3PropertyDescription >> isComposite [
	<MSEProperty: #composite type: #Boolean>
	<derived>
	^ self hasOpposite and: [ self opposite isContainer ]
]

{ #category : #accessing }
FM3PropertyDescription >> isContainer [
	<MSEProperty: #container type: #Boolean>
	^isContainer
]

{ #category : #accessing }
FM3PropertyDescription >> isContainer: anObject [
	isContainer := anObject
]

{ #category : #accessing }
FM3PropertyDescription >> isDerived [
	<MSEProperty: #derived type: #Boolean>
	^isDerived
]

{ #category : #accessing }
FM3PropertyDescription >> isDerived: anObject [
	isDerived := anObject
]

{ #category : #accessing }
FM3PropertyDescription >> isExtension [
	^ self package notNil
]

{ #category : #testing }
FM3PropertyDescription >> isFM3Property [
	^true
]

{ #category : #accessing }
FM3PropertyDescription >> isMultivalued [
	<MSEProperty: #multivalued type: #Boolean>
	^isMultivalued
]

{ #category : #accessing }
FM3PropertyDescription >> isMultivalued: anObject [
	isMultivalued := anObject
]

{ #category : #accessing }
FM3PropertyDescription >> isSource [
	^ isSource
]

{ #category : #accessing }
FM3PropertyDescription >> isSource: anObject [
	isSource := anObject
]

{ #category : #accessing }
FM3PropertyDescription >> isTarget [
	^ isTarget
]

{ #category : #accessing }
FM3PropertyDescription >> isTarget: anObject [
	isTarget := anObject
]

{ #category : #accessing }
FM3PropertyDescription >> key [
	FM3 note: 'Todo, think about and meta-describe key'.
	^key
]

{ #category : #accessing }
FM3PropertyDescription >> key: anObject [

	key := anObject asSymbol
]

{ #category : #accessing }
FM3PropertyDescription >> mmClass [
	<MSEProperty: #class type: #FM3MetaDescription opposite: #attributes>
	<container>
	
	^class 
]

{ #category : #accessing }
FM3PropertyDescription >> mmClass: newClass [
	class := FMMultivalueLink on: self
					update: #attributes
					from: self mmClass
					to: newClass.
]

{ #category : #accessing }
FM3PropertyDescription >> opposite [
	<MSEProperty: #opposite type: 'FM3.Property' opposite: #opposite>
	
	^opposite 
]

{ #category : #accessing }
FM3PropertyDescription >> opposite: new [
	
	opposite ~~ new ifTrue: [
		| old |
		old := opposite.
		opposite := new.
		old notNil ifTrue: [ old opposite: nil ].
		new notNil ifTrue: [ new opposite: self ]]
]

{ #category : #accessing }
FM3PropertyDescription >> owner [
	^self mmClass
]

{ #category : #accessing }
FM3PropertyDescription >> package [
	<MSEProperty: #package type: #FM3PackageDescription opposite: #extensions>
	
	FM3 note: 'Must return null when not an extensions method.'.
	^package 
]

{ #category : #accessing }
FM3PropertyDescription >> package: newPackage [
	
	package := FMMultivalueLink on: self
					update: #extensions
					from: self package
					to: newPackage
]

{ #category : #accessing }
FM3PropertyDescription >> packageName [
	"always returns the package name to which this property belongs, be it an extension or a core element"

	^ self isExtension 
			ifFalse: [ self owner packageName ]
			ifTrue: [ package name ]
]

{ #category : #private }
FM3PropertyDescription >> privOpposite: new [
	
	opposite := new
]

{ #category : #private }
FM3PropertyDescription >> setImplementingSelector: compiledMethod [ 
	implementingSelector := compiledMethod
]

{ #category : #'accessing-meta' }
FM3PropertyDescription >> setOn: element rawValue: array [
	"This is the internal logic to set the value inside the object.
	By default build and call a mutator for the implementing selector"
	
	element perform: self implementingSelector asMutator with: array
]

{ #category : #'accessing-meta' }
FM3PropertyDescription >> setOn: element values: array [
	"This method is meant to be used by the repository"

	| parameter |
	self implementingSelector ifNil: [ ^element at: self put: array ].
	parameter := self isMultivalued 
		ifTrue: [ array ]
		ifFalse: [ array ifEmpty: [ nil ]
			ifNotEmpty: [ 
				array size > 1 ifTrue: [ self error ].
				array first ]].
	element mmSetProperty: self to: parameter.
]

{ #category : #accessing }
FM3PropertyDescription >> type [
	<MSEProperty: #type type: #FM3MetaDescription>
	^type
]

{ #category : #accessing }
FM3PropertyDescription >> type: anObject [
	type := anObject
]
