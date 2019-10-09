Class {
	#name : #FamixTScopingEntityTest,
	#superclass : #TestCase,
	#traits : 'TFamixTScopingEntityTest',
	#classTraits : 'TFamixTScopingEntityTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTScopingEntityTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTScopingEntity).
self entity class initializeSlots: self entity.
model add: entity. 
]
