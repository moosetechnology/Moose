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
self entity: (MooseEntity new copyWithTalent:FamixTWithClassScope).
self entity class initializeSlots: self entity.
]
