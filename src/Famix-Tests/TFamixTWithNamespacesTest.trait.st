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
TFamixTWithNamespacesTest >> testWithNamespaces [
namespace1:= MooseEntity new copyWithTalent: FamixTNamespace.
namespace2:= MooseEntity new copyWithTalent: FamixTNamespace.
self entity addNamespace: namespace1.
self entity addNamespace: namespace2.
self assert: (self entity namespaces notEmpty).
	self assertCollection: self entity namespaces hasSameElements: { namespace1. namespace2 }.
self assert: namespace1 namespaceOwner equals: entity
]

{ #category : #tests }
TFamixTWithNamespacesTest >> testWithoutNamespaces [
			self assert: (self entity namespaces isEmpty)
]
