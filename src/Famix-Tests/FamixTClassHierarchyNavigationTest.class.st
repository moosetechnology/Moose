Class {
	#name : #FamixTClassHierarchyNavigationTest,
	#superclass : #TestCase,
	#traits : 'TFamixTClassHierarchyNavigationTest',
	#classTraits : 'TFamixTClassHierarchyNavigationTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTClassHierarchyNavigationTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTClassHierarchyNavigation).
self entity class initializeSlots: self entity.
]
