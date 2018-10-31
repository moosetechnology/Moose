Class {
	#name : #FamixTestComposed1Comment,
	#superclass : #FamixTestComposed1SourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1Comment class >> annotation [

	<MSEClass: #Comment super: #FamixTestComposed1SourcedEntity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposed1Comment class >> generatedSlotNames [
	<generated>
	'FamixTestComposed1Comment class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposed1Comment class >> generatedTraitNames [
	<generated>
	^ #(FamixTComment)
]

{ #category : #meta }
FamixTestComposed1Comment class >> requirements [

	<generated>
	^ {  }
]
