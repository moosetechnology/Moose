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

{ #category : #generator }
FamixTInheritanceGlue classSide >> generatedSlotNames [
	<generated>
	'FamixTInheritanceGlue class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTInheritanceGlue classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #testing }
FamixTInheritanceGlue >> isInheritance [ 
	^true
]
