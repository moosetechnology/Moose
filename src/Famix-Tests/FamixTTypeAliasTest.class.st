Class {
	#name : #FamixTTypeAliasTest,
	#superclass : #TestCase,
	#traits : 'TFamixTTypeAliasTest',
	#classTraits : 'TFamixTTypeAliasTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTTypeAliasTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTTypeAlias).
self entity class initializeSlots: self entity.
model add: entity. 
]
