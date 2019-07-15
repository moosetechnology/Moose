"
FAMIXNamespace represents a namespace from the source language. Namespaces have semantic meaning in the language so they influence the unique name of the entity.

A namespace denotes an entity that has meaning from a language point of view. For example, in C++, there exist a concept with the same name that has no other responsibility beside providing a lexical scope for the contained classes and funcions.

When an entity is placed inside a namespace, the fully qualified name (mooseName) is affected.
"
Trait {
	#name : #FamixTNamespace,
	#instVars : [
		'#namespaceEntities => FMMany type: #FamixTNamespaceEntity opposite: #parentNamespace',
		'#namespaceOwner => FMOne type: #FamixTWithNamespaces opposite: #namespaces'
	],
	#category : #'Famix-Traits-Namespaces'
}

{ #category : #meta }
FamixTNamespace classSide >> annotation [

	<MSEClass: #TNamespace super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #groups }
FamixTNamespace classSide >> famixTNamespaceRelatedGroup [

	<mooseGroup>
	
	^ FAMIXNamespaceGroup
]

{ #category : #generator }
FamixTNamespace classSide >> generatedSlotNames [
	<generated>
	'FamixTNamespace class>>#generatedSlotNames'.
	^ #(namespaceEntities namespaceOwner)
]

{ #category : #generator }
FamixTNamespace classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #testing }
FamixTNamespace >> isNamespace [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTNamespace >> namespaceEntities [

	<generated>
	^ namespaceEntities
]

{ #category : #accessing }
FamixTNamespace >> namespaceEntities: anObject [

	<generated>
	namespaceEntities value: anObject

]

{ #category : #accessing }
FamixTNamespace >> namespaceOwner [

	<generated>
	^ namespaceOwner
]

{ #category : #accessing }
FamixTNamespace >> namespaceOwner: anObject [

	<generated>
	namespaceOwner := anObject

]
