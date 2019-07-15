Class {
	#name : #FamixJavaCaughtException,
	#superclass : #FamixJavaException,
	#traits : 'FamixTCaughtException',
	#classTraits : 'FamixTCaughtException classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaCaughtException class >> annotation [

	<MSEClass: #CaughtException super: #FamixJavaException>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaCaughtException class >> generatedSlotNames [
	<generated>
	'FamixJavaCaughtException class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaCaughtException class >> generatedTraitNames [
	<generated>
	^ #(FamixTCaughtException)
]

{ #category : #meta }
FamixJavaCaughtException class >> requirements [

	<generated>
	^ {  }
]
