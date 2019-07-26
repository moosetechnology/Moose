Trait {
	#name : #TFamixTScopingEntityTest,
	#instVars : [
		'scopingEntity1',
		'scopingEntity2',
		'parentScope'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTScopingEntityTest >> testChildScopes [
scopingEntity1 := MooseEntity new copyWithTalent: FamixTScopingEntity.
scopingEntity1 class initializeSlots: scopingEntity1.
model add: scopingEntity1.
scopingEntity2 := MooseEntity new copyWithTalent: FamixTScopingEntity.
scopingEntity2 class initializeSlots: scopingEntity2.
model add: scopingEntity2.
self entity addChildScope: scopingEntity1.
self entity addChildScope: scopingEntity2.
self assert: (self entity childScopes notEmpty).
self assertCollection: self entity childScopes hasSameElements: {  scopingEntity1. scopingEntity2 }.
self assert: scopingEntity1 parentScope equals: self entity
]

{ #category : #tests }
TFamixTScopingEntityTest >> testParentScope [
parentScope := MooseEntity new copyWithTalent: FamixTScopingEntity. 
parentScope class initializeSlots: parentScope.
model add: parentScope.
self entity parentScope: parentScope. 
self assert: (self entity parentScope notNil).
self assert: self entity parentScope equals: parentScope.
self assertCollection: parentScope childScopes hasSameElements: {self entity}
]
