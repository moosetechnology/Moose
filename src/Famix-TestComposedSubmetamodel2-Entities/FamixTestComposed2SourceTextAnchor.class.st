Class {
	#name : #FamixTestComposed2SourceTextAnchor,
	#superclass : #FamixTestComposed2SourceAnchor,
	#traits : 'FamixTWithImmediateSource',
	#classTraits : 'FamixTWithImmediateSource classTrait',
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2SourceTextAnchor class >> annotation [

	<MSEClass: #SourceTextAnchor super: #FamixTestComposed2SourceAnchor>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposed2SourceTextAnchor class >> generatedSlotNames [
	<generated>
	'FamixTestComposed2SourceTextAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposed2SourceTextAnchor class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithImmediateSource)
]

{ #category : #meta }
FamixTestComposed2SourceTextAnchor class >> requirements [

	<generated>
	^ {  }
]
