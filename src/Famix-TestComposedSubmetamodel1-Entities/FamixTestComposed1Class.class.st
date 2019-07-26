Class {
	#name : #FamixTestComposed1Class,
	#superclass : #FamixTestComposed1NamedEntity,
	#traits : 'FamixTClass + FamixTSourceLanguage + FamixTWithMethods',
	#classTraits : 'FamixTClass classTrait + FamixTSourceLanguage classTrait + FamixTWithMethods classTrait',
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1Class class >> annotation [

	<MSEClass: #Class super: #FamixTestComposed1NamedEntity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTestComposed1Class class >> requirements [

	<generated>
	^ {  }
]
