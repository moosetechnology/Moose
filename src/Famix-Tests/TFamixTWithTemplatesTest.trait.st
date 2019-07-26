Trait {
	#name : #TFamixTWithTemplatesTest,
	#instVars : [
		'template1',
		'template2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithTemplatesTest >> testTemplates [
template1 := MooseEntity new copyWithTalent: FamixTTemplate.
template1 class initializeSlots: template1.
model add: template1.
template2 := MooseEntity new copyWithTalent: FamixTTemplate.
template2 class initializeSlots: template2.
model add: template2.
self entity addTemplate: template1.
self entity addTemplate: template2.
self assert: (self entity templates notEmpty).
self assertCollection: self entity templates hasSameElements: {  template1. template2 }.
self assert: template1 templateOwner equals: self entity
]
