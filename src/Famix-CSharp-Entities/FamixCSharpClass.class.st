Class {
	#name : #FamixCSharpClass,
	#superclass : #FamixCSharpType,
	#traits : 'FamixCSharpTWithProperties + FamixTClass + FamixTLCOMMetrics + FamixTWithAttributes + FamixTWithExceptions',
	#classTraits : 'FamixCSharpTWithProperties classTrait + FamixTClass classTrait + FamixTLCOMMetrics classTrait + FamixTWithAttributes classTrait + FamixTWithExceptions classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpClass class >> annotation [

	<MSEClass: #Class super: #FamixCSharpType>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]
