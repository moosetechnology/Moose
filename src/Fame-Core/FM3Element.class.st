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
	#category : #'Fame-Core'
}

{ #category : #meta }
FM3Element class >> annotation [
	<MSEClass: #Element super: #Object>
	<package: #FM3>
	<abstract>

]

{ #category : #accessing }
FM3Element class >> version [
	^ 1.0
]

{ #category : #accessing }
FM3Element >> fullName [
	<MSEProperty: #fullName type: #String>
	<derived>
	self name isNil ifTrue: [ ^nil ].
	self owner isNil ifTrue: [ ^self name asString ].
	self owner fullName isNil ifTrue: [ ^nil ].
 	^self owner fullName, '.', self name
]

{ #category : #accessing }
FM3Element >> name [
	<MSEProperty: #name type: #String>
	^name 
]

{ #category : #accessing }
FM3Element >> name: aString [
	
	name := aString isNil 
		ifTrue: [ nil ]
		ifFalse: [ aString asSymbol ].
]

{ #category : #accessing }
FM3Element >> owner [
	<MSEProperty: #owner type: #FM3Element>
	<derived>
	^nil "All packages are top-level (but dots are allowed in their name to fake nesting)"
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
