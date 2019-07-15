Class {
	#name : #FamixTestComposed1CustomEntity2,
	#superclass : #FamixTestComposed1Entity,
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1CustomEntity2 class >> annotation [

	<MSEClass: #CustomEntity2 super: #FamixTestComposed1Entity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposed1CustomEntity2 class >> generatedSlotNames [
	<generated>
	'FamixTestComposed1CustomEntity2 class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposed1CustomEntity2 class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixTestComposed1CustomEntity2 class >> requirements [

	<generated>
	^ {  }
]
