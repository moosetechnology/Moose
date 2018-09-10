"
Represent a preprocessor #ifdef/#ifndef statement

Knows the name of the macro tested and whether it is ""negated"" (#ifndef) or not (#ifdef)
"
Trait {
	#name : #FamixTPreprocessorIfdef,
	#category : #'Famix-Traits-Preprocessor'
}

{ #category : #meta }
FamixTPreprocessorIfdef classSide >> annotation [

	<MSEClass: #TPreprocessorIfdef super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTPreprocessorIfdef classSide >> generatedSlotNames [
	<generated>
	'FamixTPreprocessorIfdef class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTPreprocessorIfdef classSide >> generatedTraitNames [
	<generated>
	^ #()
]
