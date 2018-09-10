Class {
	#name : #FamixTest1IndexedFileAnchor,
	#superclass : #FamixTest1AbstractFileAnchor,
	#traits : 'FamixTIndexedFileNavigation',
	#classTraits : 'FamixTIndexedFileNavigation classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1IndexedFileAnchor class >> annotation [

	<MSEClass: #IndexedFileAnchor super: #FamixTest1AbstractFileAnchor>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest1IndexedFileAnchor class >> generatedSlotNames [
	<generated>
	'FamixTest1IndexedFileAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest1IndexedFileAnchor class >> generatedTraitNames [
	<generated>
	^ #(FamixTIndexedFileNavigation)
]

{ #category : #meta }
FamixTest1IndexedFileAnchor class >> requirements [

	<generated>
	^ {  }
]
