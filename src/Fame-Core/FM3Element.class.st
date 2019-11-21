"
A FM3Element is an elementary element of a FAME metamodel.

It has a name and fullName and a owner either a FM3MetaDescription or 
FM3PackageDescription
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
	<FMClass: #Class super: #Object>
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
