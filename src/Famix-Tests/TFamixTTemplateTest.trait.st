Trait {
	#name : #TFamixTTemplateTest,
	#instVars : [
		'templateOwner',
		'templateUser1',
		'templateUser2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTTemplateTest >> testTemplateOwner [
templateOwner := MooseEntity new copyWithTalent: FamixTWithTemplates. 
templateOwner class initializeSlots: templateOwner.
model add: templateOwner.
self entity templateOwner: templateOwner. 
self assert: (self entity templateOwner notNil).
self assert: self entity templateOwner equals: templateOwner.
self assertCollection: templateOwner templates hasSameElements: {self entity}
]

{ #category : #tests }
TFamixTTemplateTest >> testTemplateUsers [
templateUser1 := MooseEntity new copyWithTalent: FamixTTemplateUser.
templateUser1 class initializeSlots: templateUser1.
model add: templateUser1.
templateUser2 := MooseEntity new copyWithTalent: FamixTTemplateUser.
templateUser2 class initializeSlots: templateUser2.
model add: templateUser2.
self entity addTemplateUser: templateUser1.
self entity addTemplateUser: templateUser2.
self assert: (self entity templateUsers notEmpty).
self assertCollection: self entity templateUsers hasSameElements: {  templateUser1. templateUser2 }.
self assert: templateUser1 template equals: self entity
]
