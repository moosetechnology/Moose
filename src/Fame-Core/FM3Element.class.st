"
Description
--------------------

I am an abstract class representing elementary elements of a Fame metamodel.
My instances are descriptions reprensenting elements of a meta-model.

The instances of my subclasses are stored inside a FMRepository.

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
	#category : #'Fame-Core'
}

{ #category : #meta }
FM3Element class >> annotation [
	<MSEClass: #Element super: #Object>
	<package: #FM3>
	<abstract>

]

{ #category : #'instance creation' }
FM3Element class >> named: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #accessing }
FM3Element >> fullName [
	<MSEProperty: #fullName type: #String>
	<derived>
	self name ifNil: [ ^ nil ].
	self owner ifNil: [ ^ self name asString ].
	self owner fullName ifNil: [ ^ nil ].
	^ self owner fullName , '.' , self name
]

{ #category : #testing }
FM3Element >> hasOwner [
	^ self subclassResponsibility
]

{ #category : #accessing }
FM3Element >> name [
	<MSEProperty: #name type: #String>
	^name 
]

{ #category : #accessing }
FM3Element >> name: aString [
	name := aString ifNotNil: #asSymbol
]

{ #category : #accessing }
FM3Element >> owner [
	<MSEProperty: #owner type: #FM3Element>
	<derived>
	^ nil	"All packages are top-level (but dots are allowed in their name to fake nesting)"
]

{ #category : #accessing }
FM3Element >> packageName [
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
