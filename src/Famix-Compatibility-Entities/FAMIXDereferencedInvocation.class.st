Class {
	#name : #FAMIXDereferencedInvocation,
	#superclass : #FAMIXInvocation,
	#traits : 'FamixTDereferencedInvocation',
	#classTraits : 'FamixTDereferencedInvocation classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXDereferencedInvocation class >> annotation [

	<MSEClass: #DereferencedInvocation super: #FAMIXInvocation>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXDereferencedInvocation class >> generatedSlotNames [
	<generated>
	'FAMIXDereferencedInvocation class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXDereferencedInvocation class >> generatedTraitNames [
	<generated>
	^ #(FamixTDereferencedInvocation)
]

{ #category : #meta }
FAMIXDereferencedInvocation class >> requirements [

	<generated>
	^ {  }
]
