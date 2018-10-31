Class {
	#name : #FamixTestComposed1CustomEntity1,
	#superclass : #FamixTestComposed1Entity,
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1CustomEntity1 class >> annotation [

	<MSEClass: #CustomEntity1 super: #FamixTestComposed1Entity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposed1CustomEntity1 class >> generatedSlotNames [
	<generated>
	'FamixTestComposed1CustomEntity1 class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposed1CustomEntity1 class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixTestComposed1CustomEntity1 class >> requirements [

	<generated>
	^ {  }
]
