Trait {
	#name : #FamixTWithFunctions,
	#instVars : [
		'#functions => FMMany type: #FamixTFunction opposite: #functionOwner'
	],
	#category : #'Famix-Traits-Function'
}

{ #category : #meta }
FamixTWithFunctions classSide >> annotation [

	<MSEClass: #TWithFunctions super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithFunctions classSide >> generatedSlotNames [
	<generated>
	'FamixTWithFunctions class>>#generatedSlotNames'.
	^ #(functions)
]

{ #category : #generator }
FamixTWithFunctions classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithFunctions >> functions [

	<generated>
	<MSEComment: 'Functions defined in the container, if any.'>
	^ functions
]

{ #category : #accessing }
FamixTWithFunctions >> functions: anObject [

	<generated>
	functions value: anObject

]
