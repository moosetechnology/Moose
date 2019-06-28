Class {
	#name : #FamixTestComposed1SourcedEntity,
	#superclass : #FamixTestComposed1Entity,
	#traits : 'FamixTWithComments + FamixTWithSourceAnchor + FamixTWithSourceLanguage',
	#classTraits : 'FamixTWithComments classTrait + FamixTWithSourceAnchor classTrait + FamixTWithSourceLanguage classTrait',
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1SourcedEntity class >> annotation [

	<MSEClass: #SourcedEntity super: #FamixTestComposed1Entity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTestComposed1SourcedEntity class >> requirements [

	<generated>
	^ {  }
]
