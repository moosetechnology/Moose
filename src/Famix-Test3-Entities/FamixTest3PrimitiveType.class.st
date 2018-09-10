Class {
	#name : #FamixTest3PrimitiveType,
	#superclass : #FamixTest3Types,
	#traits : 'FamixTReferenceable + FamixTWithTypes',
	#classTraits : 'FamixTReferenceable classTrait + FamixTWithTypes classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3PrimitiveType class >> annotation [

	<MSEClass: #PrimitiveType super: #FamixTest3Types>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest3PrimitiveType class >> generatedSlotNames [
	<generated>
	'FamixTest3PrimitiveType class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest3PrimitiveType class >> generatedTraitNames [
	<generated>
	^ #(FamixTReferenceable FamixTWithTypes)
]

{ #category : #meta }
FamixTest3PrimitiveType class >> requirements [

	<generated>
	^ {  }
]
