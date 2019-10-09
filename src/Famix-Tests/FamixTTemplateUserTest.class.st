Class {
	#name : #FamixTTemplateUserTest,
	#superclass : #TestCase,
	#traits : 'TFamixTTemplateUserTest',
	#classTraits : 'TFamixTTemplateUserTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTTemplateUserTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTTemplateUser).
self entity class initializeSlots: self entity.
model add: entity. 
]
