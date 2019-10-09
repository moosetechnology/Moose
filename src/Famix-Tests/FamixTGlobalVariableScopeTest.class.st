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
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTGlobalVariableScope).
self entity class initializeSlots: self entity.
model add: entity. 
]
