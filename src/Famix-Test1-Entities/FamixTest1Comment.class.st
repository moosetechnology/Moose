Class {
	#name : #FamixTest1Comment,
	#superclass : #FamixTest1SourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Comment class >> annotation [

	<MSEClass: #Comment super: #FamixTest1SourcedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest1Comment class >> generatedSlotNames [
	<generated>
	'FamixTest1Comment class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest1Comment class >> generatedTraitNames [
	<generated>
	^ #(FamixTComment)
]

{ #category : #meta }
FamixTest1Comment class >> requirements [

	<generated>
	^ {  }
]
