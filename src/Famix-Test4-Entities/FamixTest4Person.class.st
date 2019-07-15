Class {
	#name : #FamixTest4Person,
	#superclass : #FamixTest4Entity,
	#instVars : [
		'#books => FMMany type: #FamixTest4Book opposite: #person'
	],
	#category : #'Famix-Test4-Entities-Entities'
}

{ #category : #meta }
FamixTest4Person class >> annotation [

	<MSEClass: #Person super: #FamixTest4Entity>
	<package: #'Famix-Test4-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest4Person class >> generatedSlotNames [
	<generated>
	'FamixTest4Person class>>#generatedSlotNames'.
	^ #(books)
]

{ #category : #generator }
FamixTest4Person class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixTest4Person class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FamixTest4Person >> books [

	<generated>
	^ books
]

{ #category : #accessing }
FamixTest4Person >> books: anObject [

	<generated>
	books value: anObject

]

{ #category : #navigation }
FamixTest4Person >> booksGroup [

	<generated>
	<navigation: 'Books'>
	^ MooseGroup
			withAll: (self books asSet)
]
