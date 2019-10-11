Class {
	#name : #FamixTDefinedInModuleTest,
	#superclass : #TestCase,
	#traits : 'TFamixTDefinedInModuleTest',
	#classTraits : 'TFamixTDefinedInModuleTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTDefinedInModuleTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTDefinedInModule).
self entity class initializeSlots: self entity.
model add: entity. 
]
