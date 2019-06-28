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
