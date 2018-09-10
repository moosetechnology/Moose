Class {
	#name : #FamixTest1FileAnchor,
	#superclass : #FamixTest1AbstractFileAnchor,
	#traits : 'FamixTFileNavigation',
	#classTraits : 'FamixTFileNavigation classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1FileAnchor class >> annotation [

	<MSEClass: #FileAnchor super: #FamixTest1AbstractFileAnchor>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest1FileAnchor class >> generatedSlotNames [
	<generated>
	'FamixTest1FileAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest1FileAnchor class >> generatedTraitNames [
	<generated>
	^ #(FamixTFileNavigation)
]

{ #category : #meta }
FamixTest1FileAnchor class >> requirements [

	<generated>
	^ {  }
]
