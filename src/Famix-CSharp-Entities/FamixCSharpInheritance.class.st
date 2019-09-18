Class {
	#name : #FamixCSharpInheritance,
	#superclass : #FamixCSharpAssociation,
	#traits : 'FamixTInheritanceGlue + FamixTSubInheritance + FamixTSuperInheritance',
	#classTraits : 'FamixTInheritanceGlue classTrait + FamixTSubInheritance classTrait + FamixTSuperInheritance classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpInheritance class >> annotation [

	<MSEClass: #Inheritance super: #FamixCSharpAssociation>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]
