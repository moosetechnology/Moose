Trait {
	#name : #TFamixTWithTypesTest,
	#instVars : [
		'type1',
		'type2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithTypesTest >> testTypes [
type1 := MooseEntity new copyWithTalent: FamixTType.
type1 class initializeSlots: type1.
model add: type1.
type2 := MooseEntity new copyWithTalent: FamixTType.
type2 class initializeSlots: type2.
model add: type2.
self entity addType: type1.
self entity addType: type2.
self assert: (self entity types notEmpty).
self assertCollection: self entity types hasSameElements: {  type1. type2 }.
self assert: type1 typeContainer equals: self entity
]
