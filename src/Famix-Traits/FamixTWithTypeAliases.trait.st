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
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithTypeAliases >> addTypeAlias: anObject [
	typeAliases add: anObject

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
	"Relation named: #typeAliases type: #FamixTTypeAlias opposite: #aliasedType"

	<generated>
	<MSEComment: 'Aliases'>
	^ typeAliases
]

{ #category : #accessing }
FamixTWithTypeAliases >> typeAliases: anObject [

	<generated>
	typeAliases value: anObject

]
