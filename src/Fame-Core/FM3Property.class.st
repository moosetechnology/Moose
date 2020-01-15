"
Description
--------------------

I represent property in a fame meta-model.

I am a property of a FM3Class and I can be stored in a FMMetaModel.

If I am an extension property, I will also be contained in a FM3Package.

I know the type of my content. This type can be a constant such as a FM3Number, FM3String or FM3Boolean, but is can also be any FM3Class.

I can have an opposite property that will be my miror.

I have multiple options (See in the API section for details):
- #isContainer
- #	isSource
- #isTarget
- #isDerived
- #isMultivalued

Public API and Key Messages
--------------------

- #isContainer 		Define if I represent a containment link in the containment DAG of the meta-model.
- #isSource 			Define if I am the source of an association in the meta-model.
- #isTarget 			Define if I am the target of an association in the meta-model.
- #isDerived 		If this property is set to true, it means the property can be computed from the non-derived properties. This mean that we can flush the content of the property or we can not export it during serialization.
- #isMultivalued 	A multivalued property is a property containing a collection as a content. In this case, the type of the property is the type of the content of the collection.	
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	class:							<aFM3Class>			The class holding the property.
	implementingSelector:		<aSymbol>				The selector of the method returning my content.
	isContainer:					<aBoolean>			If true, means that I represent a containment link in the containment DAG of the meta-model.
	isDerived:					<aBoolean>			If true, means that my content can be computed form non-derived properties and can be flushed.
	isMultivalued:				<aBoolean>			If true, means that my content is a collection.
	isSource:						<aBoolean>			If true, means that I represent the source of an association.
	isTarget:						<aBoolean>			If true, means that I represent the target of an association.
	opposite:						<aFM3Property>		(Optional) A property that is my opposite. This link should be bijectif (1-1 link in miror).
	package:						<aFM3Package>		(Optional) If I am an extension, represent the package containing me.
	type:							<aFM3Class>			The type of my content.

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
	<FMClass: #Property super: #FM3Element>
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
	<FMProperty: #composite type: #Boolean>
	<derived>
	^ self hasOpposite and: [ self opposite isContainer ]
]

{ #category : #accessing }
FM3Property >> isContainer [
	<FMProperty: #container type: #Boolean>
	^isContainer
]

{ #category : #accessing }
FM3Property >> isContainer: anObject [
	isContainer := anObject
]

{ #category : #accessing }
FM3Property >> isDerived [
	<FMProperty: #derived type: #Boolean>
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
	<FMProperty: #multivalued type: #Boolean>
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
	<FMProperty: #class type: #FM3Class opposite: #properties>
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
	<FMProperty: #opposite type: 'FM3.Property' opposite: #opposite>
	
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
	<FMProperty: #package type: #FM3Package opposite: #extensions>
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
	<FMProperty: #type type: #FM3Class>
	^type
]

{ #category : #accessing }
FM3Property >> type: anObject [
	type := anObject
]
