Class {
	#name : #FamixTSuperTest,
	#superclass : #TestCase,
	#traits : 'TFamixTSuperTest',
	#classTraits : 'TFamixTSuperTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTSuperTest >> setUp [
super setUp.
self entity: (MooseEntity new copyWithTalent:FamixTSuper).
self entity class initializeSlots: self entity.
]
