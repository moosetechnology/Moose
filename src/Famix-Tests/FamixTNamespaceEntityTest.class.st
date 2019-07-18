Class {
	#name : #FamixTNamespaceEntityTest,
	#superclass : #TestCase,
	#traits : 'TFamixTNamespaceEntityTest',
	#classTraits : 'TFamixTNamespaceEntityTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTNamespaceEntityTest >> setUp [
super setUp.
self entity: (MooseEntity new copyWithTalent:FamixTNamespaceEntity).
self entity class initializeSlots: self entity.
]
