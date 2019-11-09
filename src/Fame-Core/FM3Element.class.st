"
Description
--------------------

I am an abstract class representing elementary elements of a metamodel.

The instances of my subclasses are stored inside a FMMetaModel.

My instances have a name, a fullName and an owner that is either a FM3Class or FM3Package.

Public API and Key Messages
--------------------

- #name 			Return the name of the element.
- #fullName 		Return a name of the element containing the full name of its owner.
- #owner 			Return the owner of the element. Can be nil for root packages.

Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	name:		<aString>		Name of the element.
"
Class {
	#name : #FM3Element,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Fame-Core-Model'
}

{ #category : #meta }
FM3Element class >> annotation [
	<FMClass: #Element super: #Object>
	<package: #FM3>
	<abstract>

]

{ #category : #testing }
FM3Element class >> isAbstract [
	^ self = FM3Element
]

{ #category : #'instance creation' }
FM3Element class >> named: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #visiting }
FM3Element >> accept: arg1 [ 
	^ self subclassResponsibility
]

{ #category : #accessing }
FM3Element >> fullName [
	<FMProperty: #fullName type: #String>
	<derived>
	self name ifNil: [ ^ nil ].

	^ self owner
		ifNil: [ self name ]
		ifNotNil: [ :owner |
			owner fullName ifNotNil: [ :fullName | fullName , '.' , self name ] ]
]

{ #category : #testing }
FM3Element >> hasOwner [
	^ self owner isNotNil
]

{ #category : #accessing }
FM3Element >> name [
	<FMProperty: #name type: #String>
	^name 
]

{ #category : #accessing }
FM3Element >> name: aString [
	name := aString ifNotNil: #asSymbol
]

{ #category : #accessing }
FM3Element >> owner [
	<FMProperty: #owner type: #FM3Element>
	<derived>
	^ self subclassResponsibility
]

{ #category : #printing }
FM3Element >> printOn: aStream [
	super printOn: aStream.
	name
		ifNotNil: [ 
			aStream
				nextPut: $[;
				nextPutAll: self fullName;
				nextPut: $] ]
]
