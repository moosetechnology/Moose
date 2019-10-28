"
A FM3PropertyDescription is a fame property (attribute)

Instance Variables
	class:		<Object>
	implementingSelector:		<Object>
	isContainer:		<Object>
	isDerived:		<Object>
	isMultivalued:		<Object>
	opposite:		<Object>
	package:		<Object>
	type:		<Object>

"
Class {
	#name : #FM3Property,
	#superclass : #FM3Element,
	#instVars : [
		'isContainer',
		'isDerived',
		'isMultivalued',
		'opposite',
		'class',
		'package',
		'type',
		'implementingSelector',
		'isTarget',
		'isSource'
	],
	#category : #'Fame-Core-Model'
}

{ #category : #meta }
FM3Property class >> annotation [
	<MSEClass: #Property super: #FM3Element>
	<package: #FM3>

]

{ #category : #accessing }
FM3Property >> compiledMethod [
	^ self mmClass ifNotNil: [ :aClass | aClass implementingClass >> self implementingSelector ]
]

{ #category : #private }
FM3Property >> getFrom: element [
	"This method is meant to be used by the repository"

	| result |
	result := element mmGetProperty: self.
	^ self isMultivalued
		ifTrue: [ result ]
		ifFalse: [ result ifNil: [ Array new ] ifNotNil: [ Array with: result ] ]
]

{ #category : #private }
FM3Property >> getRawFrom: element [
	"This is internal logic for retrieving the actual value of a property from an element.
	By default call the implementing selector."

	^ element perform: self implementingSelector
]

{ #category : #testing }
FM3Property >> hasImplementingSelector [
	^ self implementingSelector notNil
]

{ #category : #testing }
FM3Property >> hasOpposite [
	^opposite notNil
]

{ #category : #accessing }
FM3Property >> implementingClass [
	"Return the real class implementing the selector of the property."

	^ self mmClass implementingClass
]

{ #category : #accessing }
FM3Property >> implementingSelector [
	^ implementingSelector
]

{ #category : #accessing }
FM3Property >> implementingSelector: compiledMethod [ 
	implementingSelector := compiledMethod
]

{ #category : #accessing }
FM3Property >> implementingType [
	"Return the real type implementing the property."

	^ self type implementingClass
]

{ #category : #initialization }
FM3Property >> initialize [
	super initialize.
	isContainer := false.
	isDerived := false.
	isMultivalued := false.
	isSource := false.
	isTarget := false
]

{ #category : #testing }
FM3Property >> isChildrenProperty [
	<MSEProperty: #composite type: #Boolean>
	<derived>
	^ self hasOpposite and: [ self opposite isContainer ]
]

{ #category : #accessing }
FM3Property >> isContainer [
	<MSEProperty: #container type: #Boolean>
	^isContainer
]

{ #category : #accessing }
FM3Property >> isContainer: anObject [
	isContainer := anObject
]

{ #category : #accessing }
FM3Property >> isDerived [
	<MSEProperty: #derived type: #Boolean>
	^isDerived
]

{ #category : #accessing }
FM3Property >> isDerived: anObject [
	isDerived := anObject
]

{ #category : #accessing }
FM3Property >> isExtension [
	^ self package notNil
]

{ #category : #testing }
FM3Property >> isFM3Property [
	^ true
]

{ #category : #accessing }
FM3Property >> isMultivalued [
	<MSEProperty: #multivalued type: #Boolean>
	^isMultivalued
]

{ #category : #accessing }
FM3Property >> isMultivalued: anObject [
	isMultivalued := anObject
]

{ #category : #accessing }
FM3Property >> isSource [
	^ isSource
]

{ #category : #accessing }
FM3Property >> isSource: anObject [
	isSource := anObject
]

{ #category : #accessing }
FM3Property >> isTarget [
	^ isTarget
]

{ #category : #accessing }
FM3Property >> isTarget: anObject [
	isTarget := anObject
]

{ #category : #accessing }
FM3Property >> mmClass [
	<MSEProperty: #class type: #FM3Class opposite: #properties>
	<container>
	
	^class 
]

{ #category : #accessing }
FM3Property >> mmClass: newClass [
	class := FMMultivalueLink on: self
					update: #properties
					from: self mmClass
					to: newClass.
]

{ #category : #accessing }
FM3Property >> opposite [
	<MSEProperty: #opposite type: 'FM3.Property' opposite: #opposite>
	
	^opposite 
]

{ #category : #accessing }
FM3Property >> opposite: new [
	| old |
	opposite == new ifTrue: [ ^ self ].

	old := opposite.
	opposite := new.
	old ifNotNil: [ old opposite: nil ].
	new ifNotNil: [ new opposite: self ]
]

{ #category : #accessing }
FM3Property >> owner [
	^ self mmClass
]

{ #category : #accessing }
FM3Property >> package [
	<MSEProperty: #package type: #FM3Package opposite: #extensions>
	self flag: 'Must return null when not an extensions method.'.
	^ package
]

{ #category : #accessing }
FM3Property >> package: newPackage [
	
	package := FMMultivalueLink on: self
					update: #extensions
					from: self package
					to: newPackage
]

{ #category : #private }
FM3Property >> setOn: element rawValue: array [
	"This is the internal logic to set the value inside the object.
	By default build and call a mutator for the implementing selector"
	
	element perform: self implementingSelector asMutator with: array
]

{ #category : #private }
FM3Property >> setOn: element values: array [
	"This method is meant to be used by the repository"

	| parameter |
	self implementingSelector ifNil: [ ^ element at: self put: array ].
	parameter := self isMultivalued
		ifTrue: [ array ]
		ifFalse: [ array
				ifEmpty: [ nil ]
				ifNotEmpty: [ array size > 1 ifTrue: [ self error ].
					array first ] ].
	element mmSetProperty: self to: parameter
]

{ #category : #accessing }
FM3Property >> type [
	<MSEProperty: #type type: #FM3Class>
	^type
]

{ #category : #accessing }
FM3Property >> type: anObject [
	type := anObject
]
