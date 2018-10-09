Class {
	#name : #FamixTest1MultipleFileAnchor,
	#superclass : #FamixTest1SourceAnchor,
	#traits : 'FamixTMultipleFileAnchor',
	#classTraits : 'FamixTMultipleFileAnchor classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1MultipleFileAnchor class >> annotation [

	<MSEClass: #MultipleFileAnchor super: #FamixTest1SourceAnchor>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest1MultipleFileAnchor class >> generatedSlotNames [
	<generated>
	'FamixTest1MultipleFileAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest1MultipleFileAnchor class >> generatedTraitNames [
	<generated>
	^ #(FamixTMultipleFileAnchor)
]

{ #category : #meta }
FamixTest1MultipleFileAnchor class >> requirements [

	<generated>
	^ {  }
]
