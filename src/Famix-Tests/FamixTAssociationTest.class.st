Class {
	#name : #FamixTAssociationTest,
	#superclass : #TestCase,
	#traits : 'TFamixTAssociationTest',
	#classTraits : 'TFamixTAssociationTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTAssociationTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTAssociation).
self entity class initializeSlots: self entity.
model add: entity. 
]
