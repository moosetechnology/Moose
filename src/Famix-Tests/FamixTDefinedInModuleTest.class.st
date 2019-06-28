Class {
	#name : #FamixTDefinedInModuleTest,
	#superclass : #TestCase,
	#traits : 'TFamixTDefinedInModuleTest',
	#classTraits : 'TFamixTDefinedInModuleTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTDefinedInModuleTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTDefinedInModule).
self entity class initializeSlots: self entity.
]
