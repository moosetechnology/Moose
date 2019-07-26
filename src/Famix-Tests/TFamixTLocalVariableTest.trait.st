Trait {
	#name : #TFamixTLocalVariableTest,
	#instVars : [
		'parentBehaviouralEntity'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTLocalVariableTest >> testParentBehaviouralEntity [
parentBehaviouralEntity := MooseEntity new copyWithTalent: FamixTWithLocalVariables. 
parentBehaviouralEntity class initializeSlots: parentBehaviouralEntity.
model add: parentBehaviouralEntity.
self entity parentBehaviouralEntity: parentBehaviouralEntity. 
self assert: (self entity parentBehaviouralEntity notNil).
self assert: self entity parentBehaviouralEntity equals: parentBehaviouralEntity.
self assertCollection: parentBehaviouralEntity localVariables hasSameElements: {self entity}
]
