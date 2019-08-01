Class {
	#name : #FamixStNamespaceChefTest,
	#superclass : #FamixStAbstractFamixStNavigationTest,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #tests }
FamixStNamespaceChefTest >> testNilNamespaceScope [
	| namespace |
	namespace := FamixStNamespace new.
	self assert: namespace namespaceScope == namespace
]
