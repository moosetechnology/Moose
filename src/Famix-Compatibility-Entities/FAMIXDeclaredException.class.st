Class {
	#name : #FAMIXDeclaredException,
	#superclass : #FAMIXException,
	#traits : 'FamixTDeclaredException',
	#classTraits : 'FamixTDeclaredException classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXDeclaredException class >> annotation [

	<MSEClass: #DeclaredException super: #FAMIXException>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXDeclaredException class >> generatedSlotNames [
	<generated>
	'FAMIXDeclaredException class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXDeclaredException class >> generatedTraitNames [
	<generated>
	^ #(FamixTDeclaredException)
]

{ #category : #meta }
FAMIXDeclaredException class >> requirements [

	<generated>
	^ {  }
]
