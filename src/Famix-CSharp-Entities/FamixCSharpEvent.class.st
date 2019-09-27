Class {
	#name : #FamixCSharpEvent,
	#superclass : #FamixCSharpMethod,
	#traits : 'FamixTContainingWithStatementsGlue + FamixTWithMethods + FamixTWithMethodsWithModifiersGlue',
	#classTraits : 'FamixTContainingWithStatementsGlue classTrait + FamixTWithMethods classTrait + FamixTWithMethodsWithModifiersGlue classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpEvent class >> annotation [

	<MSEClass: #Event super: #FamixCSharpMethod>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]
