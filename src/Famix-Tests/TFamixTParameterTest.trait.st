Trait {
	#name : #TFamixTParameterTest,
	#instVars : [
		'parentBehaviouralEntity'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTParameterTest >> testParentBehaviouralEntity [
parentBehaviouralEntity := MooseEntity new copyWithTalent: FamixTWithParameters. 
parentBehaviouralEntity class initializeSlots: parentBehaviouralEntity.
model add: parentBehaviouralEntity.
self entity parentBehaviouralEntity: parentBehaviouralEntity. 
self assert: (self entity parentBehaviouralEntity notNil).
self assert: self entity parentBehaviouralEntity equals: parentBehaviouralEntity.
self assertCollection: parentBehaviouralEntity parameters hasSameElements: {self entity}
]
