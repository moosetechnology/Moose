Trait {
	#name : #TFamixTGlobalVariableScopeTest,
	#instVars : [
		'globalVariable1',
		'globalVariable2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTGlobalVariableScopeTest >> testGlobalVariables [
globalVariable1 := MooseEntity new copyWithTalent: FamixTGlobalVariable.
globalVariable1 class initializeSlots: globalVariable1.
model add: globalVariable1.
globalVariable2 := MooseEntity new copyWithTalent: FamixTGlobalVariable.
globalVariable2 class initializeSlots: globalVariable2.
model add: globalVariable2.
self entity addGlobalVariable: globalVariable1.
self entity addGlobalVariable: globalVariable2.
self assert: (self entity globalVariables notEmpty).
self assertCollection: self entity globalVariables hasSameElements: {  globalVariable1. globalVariable2 }.
self assert: globalVariable1 parentScope equals: self entity
]
