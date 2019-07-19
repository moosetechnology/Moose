Trait {
	#name : #TFamixTGlobalVariableTest,
	#instVars : [
		'parentScope'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTGlobalVariableTest >> testParentScope [
parentScope := MooseEntity new copyWithTalent: FamixTGlobalVariableScope. 
parentScope class initializeSlots: parentScope.
model add: parentScope.
self entity parentScope: parentScope. 
self assert: (self entity parentScope notNil).
self assert: self entity parentScope equals: parentScope.
self assertCollection: parentScope globalVariables hasSameElements: {self entity}
]
