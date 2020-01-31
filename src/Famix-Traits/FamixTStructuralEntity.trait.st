"
FAMIXStructuralEntity is the abstract superclass for basic data structure in the source code. A structural entity has a declaredType that points to the type of the variable.
"
Trait {
	#name : #FamixTStructuralEntity,
	#traits : 'FamixTNamedEntity + FamixTAccessible + FamixTInvocationsReceiver + FamixTTypedEntity',
	#classTraits : 'FamixTNamedEntity classTrait + FamixTAccessible classTrait + FamixTInvocationsReceiver classTrait + FamixTTypedEntity classTrait',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTStructuralEntity classSide >> annotation [

	<FMClass: #TStructuralEntity super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #testing }
FamixTStructuralEntity >> isStructuralEntity [

	<generated>
	^ true
]
