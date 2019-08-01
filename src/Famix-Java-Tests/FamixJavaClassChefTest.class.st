Class {
	#name : #FamixJavaClassChefTest,
	#superclass : #FamixJavaAbstractFAMIXNavigationTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #tests }
FamixJavaClassChefTest >> testDefaultClassScope [
	| class |
	class := FamixJavaClass new.
	self assert: class typeScope == class
]

{ #category : #tests }
FamixJavaClassChefTest >> testNilNamespaceScope [
	self assert: FamixJavaClass new namespaceScope isNil
]
