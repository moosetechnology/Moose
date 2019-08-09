Class {
	#name : #FAMIXGlobalVariableTest,
	#superclass : #FAMIXNamedEntityTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #helpers }
FAMIXGlobalVariableTest >> actualClass [
	^ FAMIXGlobalVariable
]

{ #category : #tests }
FAMIXGlobalVariableTest >> testIsPublic [
	| entity |
	entity := self actualClass new.
	entity isPublic: true.
	self deny: entity isPublic 
]

{ #category : #tests }
FAMIXGlobalVariableTest >> testNamespaceScope [
	| namespace globalVariable |
	namespace := FAMIXNamespace new.
	globalVariable := self actualClass new parentScope: namespace.
	self assert: (globalVariable atScope: FamixTNamespace) anyOne equals: namespace
]
