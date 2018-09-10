Class {
	#name : #FAMIXThrownException,
	#superclass : #FAMIXException,
	#traits : 'FamixTThrownException',
	#classTraits : 'FamixTThrownException classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXThrownException class >> annotation [

	<MSEClass: #ThrownException super: #FAMIXException>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXThrownException class >> generatedSlotNames [
	<generated>
	'FAMIXThrownException class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXThrownException class >> generatedTraitNames [
	<generated>
	^ #(FamixTThrownException)
]

{ #category : #meta }
FAMIXThrownException class >> requirements [

	<generated>
	^ {  }
]
