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

	<FMClass: #Person super: #FamixTest4Entity>
	<package: #'Famix-Test4-Entities'>
	<generated>
	^self
]

{ #category : #adding }
FamixTest4Person >> addBook: anObject [
	<generated>
	^ self books add: anObject
]

{ #category : #accessing }
FamixTest4Person >> books [
	"Relation named: #books type: #FamixTest4Book opposite: #person"

	<generated>
	<derived>
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
	^ MooseGroup withAll: self books asSet
]
