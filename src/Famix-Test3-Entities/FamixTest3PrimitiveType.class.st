Class {
	#name : #FamixTest3PrimitiveType,
	#superclass : #FamixTest3Type,
	#traits : 'FamixTReferenceable + FamixTWithTypes',
	#classTraits : 'FamixTReferenceable classTrait + FamixTWithTypes classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3PrimitiveType class >> annotation [

	<FMClass: #PrimitiveType super: #FamixTest3Type>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]
