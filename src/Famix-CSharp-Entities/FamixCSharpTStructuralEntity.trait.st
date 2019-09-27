Trait {
	#name : #FamixCSharpTStructuralEntity,
	#traits : 'FamixTStructuralEntity + FamixTWithDereferencedInvocations',
	#classTraits : 'FamixTStructuralEntity classTrait + FamixTWithDereferencedInvocations classTrait',
	#category : #'Famix-CSharp-Entities-Traits'
}

{ #category : #meta }
FamixCSharpTStructuralEntity classSide >> annotation [

	<MSEClass: #TStructuralEntity super: #Trait>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]
