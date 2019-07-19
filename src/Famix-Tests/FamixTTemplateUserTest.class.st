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
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTTemplateUser).
self entity class initializeSlots: self entity.
model add: entity. 
]
