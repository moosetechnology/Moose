Class {
	#name : #FamixTest4Room,
	#superclass : #FamixTest4Entity,
	#instVars : [
		'#school => FMOne type: #FamixTest4School opposite: #rooms'
	],
	#category : #'Famix-Test4-Entities-Entities'
}

{ #category : #meta }
FamixTest4Room class >> annotation [

	<MSEClass: #Room super: #FamixTest4Entity>
	<package: #'Famix-Test4-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest4Room class >> generatedSlotNames [
	<generated>
	'FamixTest4Room class>>#generatedSlotNames'.
	^ #(school)
]

{ #category : #generator }
FamixTest4Room class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixTest4Room class >> requirements [

	<generated>
	^ { FamixTest4Room }
]

{ #category : #accessing }
FamixTest4Room >> school [

	<generated>
	<container>

	^ school
]

{ #category : #accessing }
FamixTest4Room >> school: anObject [

	<generated>
	school := anObject

]

{ #category : #navigation }
FamixTest4Room >> schoolGroup [

	<generated>
	<navigation: 'School'>
	^ MooseGroup
			with: (self school)
]
