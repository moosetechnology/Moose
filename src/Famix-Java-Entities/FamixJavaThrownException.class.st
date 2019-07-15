Class {
	#name : #FamixJavaThrownException,
	#superclass : #FamixJavaException,
	#traits : 'FamixTThrownException',
	#classTraits : 'FamixTThrownException classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaThrownException class >> annotation [

	<MSEClass: #ThrownException super: #FamixJavaException>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaThrownException class >> generatedSlotNames [
	<generated>
	'FamixJavaThrownException class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaThrownException class >> generatedTraitNames [
	<generated>
	^ #(FamixTThrownException)
]

{ #category : #meta }
FamixJavaThrownException class >> requirements [

	<generated>
	^ {  }
]
