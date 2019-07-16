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
self entity: (MooseEntity new copyWithTalent:FamixTScopingEntity).
self entity class initializeSlots: self entity.
]
