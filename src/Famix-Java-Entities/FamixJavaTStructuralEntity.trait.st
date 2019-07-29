Trait {
	#name : #FamixJavaTStructuralEntity,
	#traits : 'FamixTStructuralEntity + FamixTWithDereferencedInvocations',
	#classTraits : 'FamixTStructuralEntity classTrait + FamixTWithDereferencedInvocations classTrait',
	#category : #'Famix-Java-Entities-Traits'
}

{ #category : #meta }
FamixJavaTStructuralEntity classSide >> annotation [

	<MSEClass: #TStructuralEntity super: #Trait>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]
