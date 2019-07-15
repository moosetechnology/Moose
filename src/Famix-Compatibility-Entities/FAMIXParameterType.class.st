Class {
	#name : #FAMIXParameterType,
	#superclass : #FAMIXType,
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXParameterType class >> annotation [

	<MSEClass: #ParameterType super: #FAMIXType>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXParameterType class >> generatedSlotNames [
	<generated>
	'FAMIXParameterType class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXParameterType class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FAMIXParameterType class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FAMIXParameterType >> isParameterType [
	^ true
]
