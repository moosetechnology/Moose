Class {
	#name : #FamixTest1AbstractFileAnchor,
	#superclass : #FamixTest1SourceAnchor,
	#traits : 'FamixTFileAnchor',
	#classTraits : 'FamixTFileAnchor classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1AbstractFileAnchor class >> annotation [

	<MSEClass: #AbstractFileAnchor super: #FamixTest1SourceAnchor>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest1AbstractFileAnchor class >> generatedSlotNames [
	<generated>
	'FamixTest1AbstractFileAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest1AbstractFileAnchor class >> generatedTraitNames [
	<generated>
	^ #(FamixTFileAnchor)
]

{ #category : #meta }
FamixTest1AbstractFileAnchor class >> requirements [

	<generated>
	^ {  }
]
