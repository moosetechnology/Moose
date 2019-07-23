"
I am the generic class for all the tests for famix entities
"
Class {
	#name : #FamixJavaEntityTest,
	#superclass : #TestCase,
	#category : #'Famix-Java-Tests'
}

{ #category : #asserting }
FamixJavaEntityTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #helpers }
FamixJavaEntityTest >> actualClass [
	^ self subclassResponsibility
]
