Class {
	#name : #FamixTest1Class,
	#superclass : #FamixTest1NamedEntity,
	#traits : 'FamixTClass + FamixTWithMethods',
	#classTraits : 'FamixTClass classTrait + FamixTWithMethods classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #'as yet unclassified' }
FamixTest1Class class >> annotation [

	<MSEClass: #Class super: #FamixTest1NamedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest1Class class >> requirements [

	<generated>
	^ {  }
]
