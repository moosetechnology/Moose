Class {
	#name : #FamixCSharpPrimitiveType,
	#superclass : #FamixCSharpType,
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpPrimitiveType class >> annotation [

	<MSEClass: #PrimitiveType super: #FamixCSharpType>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]

{ #category : #testing }
FamixCSharpPrimitiveType >> isPrimitiveType [

	<generated>
	^ true
]
