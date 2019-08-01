"
I am an abstract test class for the tests of FamixJavaAssociation's subclasses
"
Class {
	#name : #FamixJavaAssociationTest,
	#superclass : #FamixJavaEntityTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #'as yet unclassified' }
FamixJavaAssociationTest >> actualClass [ 
		^ FamixJavaAssociation
]

{ #category : #tests }
FamixJavaAssociationTest >> testDefaultPreviousNext [
	| association |
	association := self actualClass new.
	self assert: association previous isNil.
	self assert: association next isNil
]

{ #category : #tests }
FamixJavaAssociationTest >> testPreviousNext [
	| association1 association2 |
	association1 := self actualClass new.
	association2 := self actualClass new.
	association1 previous: association2.
	self assert: association1 previous equals: association2.
	self assert: association2 next equals: association1
]
