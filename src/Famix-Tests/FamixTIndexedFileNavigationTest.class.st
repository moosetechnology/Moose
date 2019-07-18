Class {
	#name : #FamixTIndexedFileNavigationTest,
	#superclass : #TestCase,
	#traits : 'TFamixTIndexedFileNavigationTest',
	#classTraits : 'TFamixTIndexedFileNavigationTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTIndexedFileNavigationTest >> setUp [
super setUp.
self entity: (MooseEntity new copyWithTalent:FamixTIndexedFileNavigation).
self entity class initializeSlots: self entity.
]
