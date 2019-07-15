Trait {
	#name : #FamixTWithTypeAliases,
	#instVars : [
		'#typeAliases => FMMany type: #FamixTTypeAlias opposite: #aliasedType'
	],
	#category : #'Famix-Traits-TypeAlias'
}

{ #category : #meta }
FamixTWithTypeAliases classSide >> annotation [

	<MSEClass: #TWithTypeAliases super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithTypeAliases classSide >> generatedSlotNames [
	<generated>
	'FamixTWithTypeAliases class>>#generatedSlotNames'.
	^ #(typeAliases)
]

{ #category : #generator }
FamixTWithTypeAliases classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithTypeAliases >> allTypeAliases [
	| all |
	all := OrderedCollection withAll: self typeAliases.
	self typeAliases do: [:each | all addAll: each allTypeAliases ].
	^ all
]

{ #category : #accessing }
FamixTWithTypeAliases >> typeAliases [

	<generated>
	<MSEComment: 'Aliases'>
	^ typeAliases
]

{ #category : #accessing }
FamixTWithTypeAliases >> typeAliases: anObject [

	<generated>
	typeAliases value: anObject

]
