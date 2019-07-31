Class {
	#name : #FamixTest2Class,
	#superclass : #FamixTest2NamedEntity,
	#traits : 'FamixTClass + FamixTSourceLanguage',
	#classTraits : 'FamixTClass classTrait + FamixTSourceLanguage classTrait',
	#category : #'Famix-Test2-Entities-Entities'
}

{ #category : #meta }
FamixTest2Class class >> annotation [

	<MSEClass: #Class super: #FamixTest2NamedEntity>
	<package: #'Famix-Test2-Entities'>
	<generated>
	^self
]
