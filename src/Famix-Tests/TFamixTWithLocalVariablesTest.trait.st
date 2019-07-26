Trait {
	#name : #TFamixTWithLocalVariablesTest,
	#instVars : [
		'localVariable1',
		'localVariable2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithLocalVariablesTest >> testLocalVariables [
localVariable1 := MooseEntity new copyWithTalent: FamixTLocalVariable.
localVariable1 class initializeSlots: localVariable1.
model add: localVariable1.
localVariable2 := MooseEntity new copyWithTalent: FamixTLocalVariable.
localVariable2 class initializeSlots: localVariable2.
model add: localVariable2.
self entity addLocalVariable: localVariable1.
self entity addLocalVariable: localVariable2.
self assert: (self entity localVariables notEmpty).
self assertCollection: self entity localVariables hasSameElements: {  localVariable1. localVariable2 }.
self assert: localVariable1 parentBehaviouralEntity equals: self entity
]
