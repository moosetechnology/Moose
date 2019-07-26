Class {
	#name : #FamixTClassHierarchyNavigationTest,
	#superclass : #TestCase,
	#traits : 'TFamixTClassHierarchyNavigationTest',
	#classTraits : 'TFamixTClassHierarchyNavigationTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTClassHierarchyNavigationTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTClassHierarchyNavigation).
self entity class initializeSlots: self entity.
model add: entity. 
]
