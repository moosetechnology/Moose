Class {
	#name : #FamixTSubTest,
	#superclass : #TestCase,
	#traits : 'TFamixTSubTest',
	#classTraits : 'TFamixTSubTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTSubTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTSub).
self entity class initializeSlots: self entity.
model add: entity. 
]
