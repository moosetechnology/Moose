Trait {
	#name : #FamixTWithClassScope,
	#category : #'Famix-Traits-ClassScope'
}

{ #category : #meta }
FamixTWithClassScope classSide >> annotation [

	<MSEClass: #TWithClassScope super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithClassScope classSide >> generatedSlotNames [
	<generated>
	'FamixTWithClassScope class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTWithClassScope classSide >> generatedTraitNames [
	<generated>
	^ #()
]
