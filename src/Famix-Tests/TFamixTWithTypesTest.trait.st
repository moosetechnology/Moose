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
TFamixTWithTypesTest >> testWithTypes [
type1:= MooseEntity new copyWithTalent: FamixTType.
type2:= MooseEntity new copyWithTalent: FamixTType.
self entity addType: type1.
self entity addType: type2.
self assert: (self entity types notEmpty).
	self assertCollection: self entity types hasSameElements: { type1. type2 }.
self assert: type1 typeContainer equals: entity
]

{ #category : #tests }
TFamixTWithTypesTest >> testWithoutTypes [
			self assert: (self entity types isEmpty)
]
