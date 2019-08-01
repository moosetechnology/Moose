Class {
	#name : #FamixJavaNamespaceChefTest,
	#superclass : #FamixJavaAbstractFAMIXNavigationTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #tests }
FamixJavaNamespaceChefTest >> testNilNamespaceScope [
	| namespace |
	namespace := FamixJavaNamespace new.
	self assert: namespace namespaceScope == namespace
]

{ #category : #tests }
FamixJavaNamespaceChefTest >> testNoClassScope [
	self assert: FamixJavaNamespace new typeScope isEmpty
]
