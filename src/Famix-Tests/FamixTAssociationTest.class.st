Class {
	#name : #FamixTAssociationTest,
	#superclass : #TestCase,
	#traits : 'TFamixTAssociationTest',
	#classTraits : 'TFamixTAssociationTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTAssociationTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTAssociation).
self entity class initializeSlots: self entity.
]
