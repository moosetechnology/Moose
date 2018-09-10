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
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTPreprocessorDefine classSide >> generatedSlotNames [
	<generated>
	'FamixTPreprocessorDefine class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTPreprocessorDefine classSide >> generatedTraitNames [
	<generated>
	^ #()
]
