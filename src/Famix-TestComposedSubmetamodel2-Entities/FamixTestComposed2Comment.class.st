Class {
	#name : #FamixTestComposed2Comment,
	#superclass : #FamixTestComposed2SourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2Comment class >> annotation [

	<MSEClass: #Comment super: #FamixTestComposed2SourcedEntity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposed2Comment class >> generatedSlotNames [
	<generated>
	'FamixTestComposed2Comment class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposed2Comment class >> generatedTraitNames [
	<generated>
	^ #(FamixTComment)
]

{ #category : #meta }
FamixTestComposed2Comment class >> requirements [

	<generated>
	^ {  }
]
