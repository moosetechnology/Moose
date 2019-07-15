Class {
	#name : #FAMIXTraitUsage,
	#superclass : #FAMIXAssociation,
	#traits : 'FamixTTraitUsage',
	#classTraits : 'FamixTTraitUsage classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXTraitUsage class >> annotation [

	<MSEClass: #TraitUsage super: #FAMIXAssociation>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXTraitUsage class >> generatedSlotNames [
	<generated>
	'FAMIXTraitUsage class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXTraitUsage class >> generatedTraitNames [
	<generated>
	^ #(FamixTTraitUsage)
]

{ #category : #meta }
FAMIXTraitUsage class >> requirements [

	<generated>
	^ {  }
]
