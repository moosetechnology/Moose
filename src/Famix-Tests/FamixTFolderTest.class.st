Class {
	#name : #FamixTFolderTest,
	#superclass : #TestCase,
	#traits : 'TFamixTFolderTest',
	#classTraits : 'TFamixTFolderTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTFolderTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTFolder).
self entity class initializeSlots: self entity.
model add: entity. 
]
