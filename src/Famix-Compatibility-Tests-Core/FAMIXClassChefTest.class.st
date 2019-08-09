Class {
	#name : #FAMIXClassChefTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #tests }
FAMIXClassChefTest >> testNilNamespaceScope [
	self assert: FAMIXClass new namespaceScope isNil
]
