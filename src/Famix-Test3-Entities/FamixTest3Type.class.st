Class {
	#name : #FamixTest3Type,
	#superclass : #FamixTest3NamedEntity,
	#traits : 'FamixTType',
	#classTraits : 'FamixTType classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Type class >> annotation [

	<MSEClass: #Type super: #FamixTest3NamedEntity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest3Type class >> requirements [

	<generated>
	^ { FamixTest3PrimitiveType }
]

{ #category : #accessing }
FamixTest3Type >> belongsTo [

	<generated>
	^ self typeContainer

]

{ #category : #accessing }
FamixTest3Type >> belongsTo: anObject [

	<generated>
	self typeContainer: anObject

]
