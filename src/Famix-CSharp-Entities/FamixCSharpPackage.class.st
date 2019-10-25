Class {
	#name : #FamixCSharpPackage,
	#superclass : #FamixCSharpScopingEntity,
	#traits : 'FamixTPackage + FamixTPackageWithClassesGlue',
	#classTraits : 'FamixTPackage classTrait + FamixTPackageWithClassesGlue classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpPackage class >> annotation [

	<MSEClass: #Package super: #FamixCSharpScopingEntity>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]
