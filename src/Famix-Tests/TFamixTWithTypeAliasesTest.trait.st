Trait {
	#name : #TFamixTWithTypeAliasesTest,
	#instVars : [
		'typeAlias1',
		'typeAlias2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithTypeAliasesTest >> testTypeAliases [
typeAlias1 := MooseEntity new copyWithTalent: FamixTTypeAlias.
typeAlias1 class initializeSlots: typeAlias1.
model add: typeAlias1.
typeAlias2 := MooseEntity new copyWithTalent: FamixTTypeAlias.
typeAlias2 class initializeSlots: typeAlias2.
model add: typeAlias2.
self entity addTypeAlias: typeAlias1.
self entity addTypeAlias: typeAlias2.
self assert: (self entity typeAliases notEmpty).
self assertCollection: self entity typeAliases hasSameElements: {  typeAlias1. typeAlias2 }.
self assert: typeAlias1 aliasedType equals: self entity
]
