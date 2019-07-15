Class {
	#name : #FAMIXNamespaceChefTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #tests }
FAMIXNamespaceChefTest >> testNilNamespaceScope [
	| namespace |
	namespace := FAMIXNamespace new.
	self assert: namespace namespaceScope == namespace
]

{ #category : #tests }
FAMIXNamespaceChefTest >> testNoClassScope [
	self assert: FAMIXNamespace new typeScope isEmpty
]
