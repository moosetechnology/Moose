Class {
	#name : #FamixTestComposed1SourceTextAnchor,
	#superclass : #FamixTestComposed1SourceAnchor,
	#traits : 'FamixTWithImmediateSource',
	#classTraits : 'FamixTWithImmediateSource classTrait',
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1SourceTextAnchor class >> annotation [

	<MSEClass: #SourceTextAnchor super: #FamixTestComposed1SourceAnchor>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposed1SourceTextAnchor class >> generatedSlotNames [
	<generated>
	'FamixTestComposed1SourceTextAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposed1SourceTextAnchor class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithImmediateSource)
]

{ #category : #meta }
FamixTestComposed1SourceTextAnchor class >> requirements [

	<generated>
	^ {  }
]
