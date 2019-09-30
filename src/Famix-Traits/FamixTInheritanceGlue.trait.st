Trait {
	#name : #FamixTInheritanceGlue,
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTInheritanceGlue classSide >> annotation [

	<MSEClass: #TInheritanceGlue super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #testing }
FamixTInheritanceGlue >> isInheritance [ 
	^true
]
