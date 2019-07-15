"
FAMIXNamespace represents a namespace from the source language. Namespaces have semantic meaning in the language so they influence the unique name of the entity.

A namespace denotes an entity that has meaning from a language point of view. For example, in C++, there exist a concept with the same name that has no other responsibility beside providing a lexical scope for the contained classes and funcions.

When an entity is placed inside a namespace, the fully qualified name (mooseName) is affected.
"
Class {
	#name : #FAMIXNamespace,
	#superclass : #FAMIXScopingEntity,
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXNamespace class >> annotation [
	<MSEClass: #Namespace super: #FAMIXScopingEntity>
	<package: #FAMIX>
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXNamespace >> namespaceScope [

	^ self 
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXNamespace >> packageScope [

	self shouldNotImplement
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXNamespace >> selectWithinYourScope: aMooseQueryResult [
	^ aMooseQueryResult withinNamespace: self
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXNamespace >> yourScope [

	^ #namespaceScope

]
