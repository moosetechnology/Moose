"
I am an abstract test class for the tests of FamixStAssociation's subclasses
"
Class {
	#name : #FamixStAssociationTest,
	#superclass : #FamixStEntityTest,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #'as yet unclassified' }
FamixStAssociationTest >> actualClass [ 
		^ FamixStAssociation
]

{ #category : #tests }
FamixStAssociationTest >> testDefaultPreviousNext [
	| association |
	association := self actualClass new.
	self assert: association previous isNil.
	self assert: association next isNil
]

{ #category : #tests }
FamixStAssociationTest >> testPreviousNext [
	| association1 association2 |
	association1 := self actualClass new.
	association2 := self actualClass new.
	association1 previous: association2.
	self assert: association1 previous equals: association2.
	self assert: association2 next equals: association1
]
