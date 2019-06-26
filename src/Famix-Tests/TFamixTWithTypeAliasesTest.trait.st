Trait {
	#name : #TFamixTWithTypeAliasesTest,
	#instVars : [
		'typealiase1',
		'typealiase2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithTypeAliasesTest >> testWithTypeAliases [
typealiase1:= MooseEntity new copyWithTalent: FamixTTypeAlias.
typealiase2:= MooseEntity new copyWithTalent: FamixTTypeAlias.
self entity addTypeAlias: typealiase1.
self entity addTypeAlias: typealiase2.
self assert: (self entity typeAliases notEmpty).
	self assertCollection: self entity typeAliases hasSameElements: { typealiase1. typealiase2 }.
self assert: typealiase1 aliasedType equals: entity
]

{ #category : #tests }
TFamixTWithTypeAliasesTest >> testWithoutTypeAliases [
			self assert: (self entity typeAliases isEmpty)
]
