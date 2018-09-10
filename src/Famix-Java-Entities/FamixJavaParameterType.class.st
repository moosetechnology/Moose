Class {
	#name : #FamixJavaParameterType,
	#superclass : #FamixJavaType,
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParameterType class >> annotation [

	<MSEClass: #ParameterType super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaParameterType class >> generatedSlotNames [
	<generated>
	'FamixJavaParameterType class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaParameterType class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixJavaParameterType class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
FamixJavaParameterType >> isParameterType [
	^ true
]
