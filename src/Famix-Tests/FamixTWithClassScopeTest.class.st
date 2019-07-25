Class {
	#name : #FamixTWithClassScopeTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithClassScopeTest',
	#classTraits : 'TFamixTWithClassScopeTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithClassScopeTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTWithClassScope).
self entity class initializeSlots: self entity.
model add: entity. 
]
