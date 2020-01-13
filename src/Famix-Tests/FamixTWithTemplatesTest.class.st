Class {
	#name : #FamixTWithTemplatesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithTemplatesTest',
	#classTraits : 'TFamixTWithTemplatesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithTemplatesTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTWithTemplates).
self entity class initializeSlots: self entity.
model add: entity. 
]
