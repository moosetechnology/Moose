Class {
	#name : #FamixTFileIncludeTest,
	#superclass : #TestCase,
	#traits : 'TFamixTFileIncludeTest',
	#classTraits : 'TFamixTFileIncludeTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTFileIncludeTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTFileInclude).
self entity class initializeSlots: self entity.
model add: entity. 
]
