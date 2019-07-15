Class {
	#name : #FamixTTemplateUserTest,
	#superclass : #TestCase,
	#traits : 'TFamixTTemplateUserTest',
	#classTraits : 'TFamixTTemplateUserTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTTemplateUserTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTTemplateUser).
self entity class initializeSlots: self entity.
]
