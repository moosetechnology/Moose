Class {
	#name : #FamixTestComposed2Class,
	#superclass : #FamixTestComposed2NamedEntity,
	#traits : 'FamixTClass + FamixTSourceLanguage + FamixTWithMethods',
	#classTraits : 'FamixTClass classTrait + FamixTSourceLanguage classTrait + FamixTWithMethods classTrait',
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2Class class >> annotation [

	<MSEClass: #Class super: #FamixTestComposed2NamedEntity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	^self
]
