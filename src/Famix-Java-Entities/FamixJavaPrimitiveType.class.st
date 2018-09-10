Class {
	#name : #FamixJavaPrimitiveType,
	#superclass : #FamixJavaType,
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaPrimitiveType class >> annotation [

	<MSEClass: #PrimitiveType super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaPrimitiveType class >> generatedSlotNames [
	<generated>
	'FamixJavaPrimitiveType class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaPrimitiveType class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixJavaPrimitiveType class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FamixJavaPrimitiveType >> isPrimitiveType [

	<generated>
	^ true
]
