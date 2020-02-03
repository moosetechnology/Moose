"
FAMIXNamespace represents a namespace from the source language. Namespaces have semantic meaning in the language so they influence the unique name of the entity.

A namespace denotes an entity that has meaning from a language point of view. For example, in C++, there exist a concept with the same name that has no other responsibility beside providing a lexical scope for the contained classes and funcions.

When an entity is placed inside a namespace, the fully qualified name (mooseName) is affected.
"
Trait {
	#name : #FamixTNamespace,
	#category : #'Famix-Traits-Named'
}

{ #category : #meta }
FamixTNamespace classSide >> annotation [

	<FMClass: #TNamespace super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #groups }
FamixTNamespace classSide >> famixTNamespaceRelatedGroup [

	<mooseGroup>
	
	^ FAMIXNamespaceGroup
]

{ #category : #testing }
FamixTNamespace >> isNamespace [

	<generated>
	^ true
]
