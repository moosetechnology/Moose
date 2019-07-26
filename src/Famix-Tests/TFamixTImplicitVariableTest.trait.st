Trait {
	#name : #TFamixTImplicitVariableTest,
	#instVars : [
		'parentBehaviouralEntity'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTImplicitVariableTest >> testParentBehaviouralEntity [
parentBehaviouralEntity := MooseEntity new copyWithTalent: FamixTWithImplicitVariables. 
parentBehaviouralEntity class initializeSlots: parentBehaviouralEntity.
model add: parentBehaviouralEntity.
self entity parentBehaviouralEntity: parentBehaviouralEntity. 
self assert: (self entity parentBehaviouralEntity notNil).
self assert: self entity parentBehaviouralEntity equals: parentBehaviouralEntity.
self assertCollection: parentBehaviouralEntity implicitVariables hasSameElements: {self entity}
]
