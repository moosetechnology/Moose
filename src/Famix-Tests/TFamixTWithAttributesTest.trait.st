Trait {
	#name : #TFamixTWithAttributesTest,
	#instVars : [
		'attribute1',
		'attribute2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithAttributesTest >> testAttributes [
attribute1 := MooseEntity new copyWithTalent: FamixTAttribute.
attribute1 class initializeSlots: attribute1.
model add: attribute1.
attribute2 := MooseEntity new copyWithTalent: FamixTAttribute.
attribute2 class initializeSlots: attribute2.
model add: attribute2.
self entity addAttribute: attribute1.
self entity addAttribute: attribute2.
self assert: (self entity attributes notEmpty).
self assertCollection: self entity attributes hasSameElements: {  attribute1. attribute2 }.
self assert: attribute1 parentType equals: self entity
]
