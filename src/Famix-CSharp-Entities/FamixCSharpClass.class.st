Class {
	#name : #FamixCSharpClass,
	#superclass : #FamixCSharpType,
	#traits : 'FamixTClass + FamixTLCOMMetrics + FamixTWithExceptions',
	#classTraits : 'FamixTClass classTrait + FamixTLCOMMetrics classTrait + FamixTWithExceptions classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpClass class >> annotation [

	<MSEClass: #Class super: #FamixCSharpType>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]
