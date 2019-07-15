Class {
	#name : #FamixTest1SourceTextAnchor,
	#superclass : #FamixTest1SourceAnchor,
	#traits : 'FamixTWithImmediateSource',
	#classTraits : 'FamixTWithImmediateSource classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1SourceTextAnchor class >> annotation [

	<MSEClass: #SourceTextAnchor super: #FamixTest1SourceAnchor>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest1SourceTextAnchor class >> generatedSlotNames [
	<generated>
	'FamixTest1SourceTextAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest1SourceTextAnchor class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithImmediateSource)
]

{ #category : #meta }
FamixTest1SourceTextAnchor class >> requirements [

	<generated>
	^ {  }
]
