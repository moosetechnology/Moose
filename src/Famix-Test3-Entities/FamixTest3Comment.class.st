Class {
	#name : #FamixTest3Comment,
	#superclass : #FamixTest3SourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Comment class >> annotation [

	<MSEClass: #Comment super: #FamixTest3SourcedEntity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest3Comment class >> generatedSlotNames [
	<generated>
	'FamixTest3Comment class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest3Comment class >> generatedTraitNames [
	<generated>
	^ #(FamixTComment)
]

{ #category : #meta }
FamixTest3Comment class >> requirements [

	<generated>
	^ {  }
]
