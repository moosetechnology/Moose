Class {
	#name : #FamixStClassChefTest,
	#superclass : #FamixStAbstractFamixStNavigationTest,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #tests }
FamixStClassChefTest >> testDefaultClassScope [
	| class |
	class := FamixStClass new.
	self assert: class typeScope == class
]

{ #category : #tests }
FamixStClassChefTest >> testNilNamespaceScope [
	self assert: FamixStClass new namespaceScope isNil
]
