Trait {
	#name : #TFamixTWithNamespacesTest,
	#instVars : [
		'namespace1',
		'namespace2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithNamespacesTest >> testNamespaces [
namespace1 := MooseEntity new copyWithTalent: FamixTNamespace.
namespace1 class initializeSlots: namespace1.
model add: namespace1.
namespace2 := MooseEntity new copyWithTalent: FamixTNamespace.
namespace2 class initializeSlots: namespace2.
model add: namespace2.
self entity addNamespace: namespace1.
self entity addNamespace: namespace2.
self assert: (self entity namespaces notEmpty).
self assertCollection: self entity namespaces hasSameElements: {  namespace1. namespace2 }.
self assert: namespace1 namespaceOwner equals: self entity
]
