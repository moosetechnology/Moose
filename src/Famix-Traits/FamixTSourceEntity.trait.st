"
FAMIXSourcedEntity models any fact in a program source and it is the superclass (root class) of all source code entities and their relationships. It is a FAMIXEntity and it can hold comments, a source anchor and a source language.
"
Trait {
	#name : #FamixTSourceEntity,
	#traits : 'FamixTWithSourceAnchor + FamixTWithSourceLanguage',
	#classTraits : 'FamixTWithSourceAnchor classTrait + FamixTWithSourceLanguage classTrait',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTSourceEntity classSide >> annotation [

	<MSEClass: #TSourceEntity super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]
