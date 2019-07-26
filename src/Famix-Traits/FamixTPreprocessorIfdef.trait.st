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
	<package: #'Famix-Traits'>
	<generated>
	^self
]
