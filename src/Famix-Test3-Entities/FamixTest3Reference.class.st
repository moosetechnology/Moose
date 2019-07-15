Class {
	#name : #FamixTest3Reference,
	#superclass : #FamixTest3Association,
	#traits : 'FamixTReference',
	#classTraits : 'FamixTReference classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Reference class >> annotation [

	<MSEClass: #Reference super: #FamixTest3Association>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest3Reference class >> generatedSlotNames [
	<generated>
	'FamixTest3Reference class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest3Reference class >> generatedTraitNames [
	<generated>
	^ #(FamixTReference)
]

{ #category : #meta }
FamixTest3Reference class >> requirements [

	<generated>
	^ {  }
]
