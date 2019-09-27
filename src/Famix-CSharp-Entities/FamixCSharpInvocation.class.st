Class {
	#name : #FamixCSharpInvocation,
	#superclass : #FamixCSharpAssociation,
	#traits : 'FamixTInvocation + FamixTWithSignature',
	#classTraits : 'FamixTInvocation classTrait + FamixTWithSignature classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpInvocation class >> annotation [

	<MSEClass: #Invocation super: #FamixCSharpAssociation>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]
