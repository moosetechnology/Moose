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

	<FMClass: #Book super: #FamixTest4Entity>
	<package: #'Famix-Test4-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTest4Book >> person [
	"Relation named: #person type: #FamixTest4Person opposite: #books"

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
	^ MooseGroup with: self person
]
