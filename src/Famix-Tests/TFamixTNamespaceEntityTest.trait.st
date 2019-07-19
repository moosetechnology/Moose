Trait {
	#name : #TFamixTNamespaceEntityTest,
	#instVars : [
		'parentNamespace'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTNamespaceEntityTest >> testParentNamespace [
parentNamespace := MooseEntity new copyWithTalent: FamixTNamespace. 
parentNamespace class initializeSlots: parentNamespace.
model add: parentNamespace.
self entity parentNamespace: parentNamespace. 
self assert: (self entity parentNamespace notNil).
self assert: self entity parentNamespace equals: parentNamespace.
self assertCollection: parentNamespace namespaceEntities hasSameElements: {self entity}
]
