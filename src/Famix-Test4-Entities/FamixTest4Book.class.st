Class {
	#name : #FamixTest4Book,
	#superclass : #FamixTest4Entity,
	#instVars : [
		'#person => FMOne type: #FamixTest4Person opposite: #books'
	],
	#category : #'Famix-Test4-Entities-Entities'
}

{ #category : #meta }
FamixTest4Book class >> annotation [

	<MSEClass: #Book super: #FamixTest4Entity>
	<package: #'Famix-Test4-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest4Book class >> generatedSlotNames [
	<generated>
	'FamixTest4Book class>>#generatedSlotNames'.
	^ #(person)
]

{ #category : #generator }
FamixTest4Book class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixTest4Book class >> requirements [

	<generated>
	^ { FamixTest4Person }
]

{ #category : #accessing }
FamixTest4Book >> person [

	<generated>
	<container>

	^ person
]

{ #category : #accessing }
FamixTest4Book >> person: anObject [

	<generated>
	person := anObject

]

{ #category : #navigation }
FamixTest4Book >> personGroup [

	<generated>
	<navigation: 'Person'>
	^ MooseGroup
			with: (self person)
]
