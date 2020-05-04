Trait {
	#name : #FamixJavaTStructuralEntity,
	#traits : 'FamixTStructuralEntity + FamixTWithDereferencedInvocations',
	#classTraits : 'FamixTStructuralEntity classTrait + FamixTWithDereferencedInvocations classTrait',
	#category : #'Famix-Java-Entities-Traits'
}

{ #category : #meta }
FamixJavaTStructuralEntity classSide >> annotation [

	<FMClass: #TStructuralEntity super: #Object>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]
