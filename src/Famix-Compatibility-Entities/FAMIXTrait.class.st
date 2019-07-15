Class {
	#name : #FAMIXTrait,
	#superclass : #FAMIXType,
	#traits : 'FamixTTrait',
	#classTraits : 'FamixTTrait classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXTrait class >> annotation [

	<MSEClass: #Trait super: #FAMIXType>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXTrait class >> generatedSlotNames [
	<generated>
	'FAMIXTrait class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXTrait class >> generatedTraitNames [
	<generated>
	^ #(FamixTTrait)
]

{ #category : #meta }
FAMIXTrait class >> requirements [

	<generated>
	^ {  }
]
