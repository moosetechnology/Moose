Class {
	#name : #FAMIXLeafEntity,
	#superclass : #FAMIXNamedEntity,
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXLeafEntity class >> annotation [

	<MSEClass: #LeafEntity super: #FAMIXNamedEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXLeafEntity class >> generatedSlotNames [
	<generated>
	'FAMIXLeafEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXLeafEntity class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FAMIXLeafEntity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #visiting }
FAMIXLeafEntity >> accept: aVisitor [

	aVisitor visitLeafEntity: self
]
