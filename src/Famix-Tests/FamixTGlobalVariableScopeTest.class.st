Class {
	#name : #FamixTGlobalVariableScopeTest,
	#superclass : #TestCase,
	#traits : 'TFamixTGlobalVariableScopeTest',
	#classTraits : 'TFamixTGlobalVariableScopeTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTGlobalVariableScopeTest >> setUp [
super setUp.
self entity: (MooseEntity new copyWithTalent:FamixTGlobalVariableScope).
self entity class initializeSlots: self entity.
]
