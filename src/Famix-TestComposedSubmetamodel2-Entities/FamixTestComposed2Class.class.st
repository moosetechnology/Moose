Class {
	#name : #FamixTestComposed2Class,
	#superclass : #FamixTestComposed2NamedEntity,
	#traits : 'FamixTClass + FamixTWithMethods',
	#classTraits : 'FamixTClass classTrait + FamixTWithMethods classTrait',
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #'as yet unclassified' }
FamixTestComposed2Class class >> annotation [

	<MSEClass: #Class super: #FamixTestComposed2NamedEntity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTestComposed2Class class >> requirements [

	<generated>
	^ {  }
]
