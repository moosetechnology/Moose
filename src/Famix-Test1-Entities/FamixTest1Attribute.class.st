Class {
	#name : #FamixTest1Attribute,
	#superclass : #FamixTest1NamedEntity,
	#traits : 'FamixTAttribute',
	#classTraits : 'FamixTAttribute classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Attribute class >> annotation [

	<MSEClass: #Attribute super: #FamixTest1NamedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTest1Attribute >> belongsTo [

	<generated>
	^ self parentType

]

{ #category : #accessing }
FamixTest1Attribute >> belongsTo: anObject [

	<generated>
	self parentType: anObject

]
