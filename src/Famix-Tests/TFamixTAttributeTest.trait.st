Trait {
	#name : #TFamixTAttributeTest,
	#instVars : [
		'parentType'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTAttributeTest >> testParentType [
parentType := MooseEntity new copyWithTalent: FamixTWithAttributes. 
parentType class initializeSlots: parentType.
model add: parentType.
self entity parentType: parentType. 
self assert: (self entity parentType notNil).
self assert: self entity parentType equals: parentType.
self assertCollection: parentType attributes hasSameElements: {self entity}
]
