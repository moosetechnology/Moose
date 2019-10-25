Class {
	#name : #FamixCSharpParameterizedType,
	#superclass : #FamixCSharpType,
	#traits : 'FamixTParameterizedType + FamixTWithParameterizedTypeUsers',
	#classTraits : 'FamixTParameterizedType classTrait + FamixTWithParameterizedTypeUsers classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpParameterizedType class >> annotation [

	<MSEClass: #ParameterizedType super: #FamixCSharpType>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]
