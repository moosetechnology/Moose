Trait {
	#name : #TFamixTTypeAliasTest,
	#instVars : [
		'aliasedType'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTTypeAliasTest >> testAliasedType [
aliasedType := MooseEntity new copyWithTalent: FamixTWithTypeAliases. 
aliasedType class initializeSlots: aliasedType.
model add: aliasedType.
self entity aliasedType: aliasedType. 
self assert: (self entity aliasedType notNil).
self assert: self entity aliasedType equals: aliasedType.
self assertCollection: aliasedType typeAliases hasSameElements: {self entity}
]
