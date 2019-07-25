Trait {
	#name : #TFamixTModuleTest,
	#instVars : [
		'definedInModule1',
		'definedInModule2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTModuleTest >> testModuleEntities [
definedInModule1 := MooseEntity new copyWithTalent: FamixTDefinedInModule.
definedInModule1 class initializeSlots: definedInModule1.
model add: definedInModule1.
definedInModule2 := MooseEntity new copyWithTalent: FamixTDefinedInModule.
definedInModule2 class initializeSlots: definedInModule2.
model add: definedInModule2.
self entity addModuleEntity: definedInModule1.
self entity addModuleEntity: definedInModule2.
self assert: (self entity moduleEntities notEmpty).
self assertCollection: self entity moduleEntities hasSameElements: {  definedInModule1. definedInModule2 }.
self assert: definedInModule1 parentModule equals: self entity
]
