Trait {
	#name : #FamixTInheritanceGlue,
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTInheritanceGlue classSide >> annotation [

	<MSEClass: #TInheritanceGlue super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #testing }
FamixTInheritanceGlue >> isInheritance [ 
	^true
]
