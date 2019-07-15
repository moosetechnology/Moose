Class {
	#name : #FamixStReference,
	#superclass : #FamixStAssociation,
	#traits : 'FamixTReference',
	#classTraits : 'FamixTReference classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStReference class >> annotation [

	<MSEClass: #Reference super: #FamixStAssociation>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStReference class >> generatedSlotNames [
	<generated>
	'FamixStReference class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixStReference class >> generatedTraitNames [
	<generated>
	^ #(FamixTReference)
]

{ #category : #meta }
FamixStReference class >> requirements [

	<generated>
	^ {  }
]
