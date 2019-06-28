Class {
	#name : #FAMIXPrimitiveType,
	#superclass : #FAMIXType,
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXPrimitiveType class >> annotation [

	<MSEClass: #PrimitiveType super: #FAMIXType>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #meta }
FAMIXPrimitiveType class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FAMIXPrimitiveType >> isPrimitiveType [

	<generated>
	^ true
]
