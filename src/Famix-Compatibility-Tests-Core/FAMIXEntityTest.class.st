"
I am the generic class for all the tests for famix entities
"
Class {
	#name : #FAMIXEntityTest,
	#superclass : #TestCase,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #asserting }
FAMIXEntityTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #helpers }
FAMIXEntityTest >> actualClass [
	^ self subclassResponsibility
]
