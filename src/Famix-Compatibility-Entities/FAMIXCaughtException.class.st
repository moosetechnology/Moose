Class {
	#name : #FAMIXCaughtException,
	#superclass : #FAMIXException,
	#traits : 'FamixTCaughtException',
	#classTraits : 'FamixTCaughtException classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXCaughtException class >> annotation [

	<MSEClass: #CaughtException super: #FAMIXException>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXCaughtException class >> generatedSlotNames [
	<generated>
	'FAMIXCaughtException class>>#generatedSlotNames'.
	^ #()
]

{ #category : #meta }
FAMIXCaughtException class >> requirements [

	<generated>
	^ {  }
]
