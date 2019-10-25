Class {
	#name : #FamixTAccessibleTest,
	#superclass : #TestCase,
	#traits : 'TFamixTAccessibleTest',
	#classTraits : 'TFamixTAccessibleTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTAccessibleTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTAccessible).
self entity class initializeSlots: self entity.
model add: entity. 
]
