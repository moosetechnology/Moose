Class {
	#name : #FamixTest4Entity,
	#superclass : #MooseEntity,
	#instVars : [
		'name'
	],
	#category : #'Famix-Test4-Entities-Entities'
}

{ #category : #meta }
FamixTest4Entity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #'Famix-Test4-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest4Entity class >> generatedSlotNames [
	<generated>
	'FamixTest4Entity class>>#generatedSlotNames'.
	^ #(name)
]

{ #category : #generator }
FamixTest4Entity class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixTest4Entity class >> metamodel [

	<generated>
	^ (self class environment at: #FamixTest4Generator) metamodel
]

{ #category : #meta }
FamixTest4Entity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FamixTest4Entity >> name [

	<MSEProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
FamixTest4Entity >> name: anObject [

	<generated>
	name := anObject

]
