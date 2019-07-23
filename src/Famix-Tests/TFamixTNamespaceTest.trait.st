Trait {
	#name : #TFamixTNamespaceTest,
	#instVars : [
		'namespaceEntity1',
		'namespaceEntity2',
		'namespaceOwner'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTNamespaceTest >> testNamespaceEntities [
namespaceEntity1 := MooseEntity new copyWithTalent: FamixTNamespaceEntity.
namespaceEntity1 class initializeSlots: namespaceEntity1.
model add: namespaceEntity1.
namespaceEntity2 := MooseEntity new copyWithTalent: FamixTNamespaceEntity.
namespaceEntity2 class initializeSlots: namespaceEntity2.
model add: namespaceEntity2.
self entity addNamespaceEntity: namespaceEntity1.
self entity addNamespaceEntity: namespaceEntity2.
self assert: (self entity namespaceEntities notEmpty).
self assertCollection: self entity namespaceEntities hasSameElements: {  namespaceEntity1. namespaceEntity2 }.
self assert: namespaceEntity1 parentNamespace equals: self entity
]

{ #category : #tests }
TFamixTNamespaceTest >> testNamespaceOwner [
namespaceOwner := MooseEntity new copyWithTalent: FamixTWithNamespaces. 
namespaceOwner class initializeSlots: namespaceOwner.
model add: namespaceOwner.
self entity namespaceOwner: namespaceOwner. 
self assert: (self entity namespaceOwner notNil).
self assert: self entity namespaceOwner equals: namespaceOwner.
self assertCollection: namespaceOwner namespaces hasSameElements: {self entity}
]
