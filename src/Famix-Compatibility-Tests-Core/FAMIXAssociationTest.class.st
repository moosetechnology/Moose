"
I am an abstract test class for the tests of FAMIXAssociation's subclasses
"
Class {
	#name : #FAMIXAssociationTest,
	#superclass : #FAMIXEntityTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #testing }
FAMIXAssociationTest class >> isAbstract [
	^ self = FAMIXAssociationTest
]

{ #category : #tests }
FAMIXAssociationTest >> testDefaultPreviousNext [
	| association |
	association := self actualClass new.
	self assert: association previous isNil.
	self assert: association next isNil
]

{ #category : #tests }
FAMIXAssociationTest >> testPreviousNext [
	| association1 association2 |
	association1 := self actualClass new.
	association2 := self actualClass new.
	association1 previous: association2.
	self assert: association1 previous equals: association2.
	self assert: association2 next equals: association1
]
