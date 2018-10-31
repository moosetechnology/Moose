Class {
	#name : #FamixTestComposed2CustomEntity1,
	#superclass : #FamixTestComposed2Entity,
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2CustomEntity1 class >> annotation [

	<MSEClass: #CustomEntity1 super: #FamixTestComposed2Entity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposed2CustomEntity1 class >> generatedSlotNames [
	<generated>
	'FamixTestComposed2CustomEntity1 class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposed2CustomEntity1 class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixTestComposed2CustomEntity1 class >> requirements [

	<generated>
	^ {  }
]
