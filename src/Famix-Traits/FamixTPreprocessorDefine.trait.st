"
Represent a preprocessor #define statement

Knows the name of the macro defined
"
Trait {
	#name : #FamixTPreprocessorDefine,
	#category : #'Famix-Traits-Preprocessor'
}

{ #category : #meta }
FamixTPreprocessorDefine classSide >> annotation [

	<MSEClass: #TPreprocessorDefine super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]
