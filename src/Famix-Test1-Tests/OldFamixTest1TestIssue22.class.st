Class {
	#name : #OldFamixTest1TestIssue22,
	#superclass : #FamixTest1SimpleModelTest,
	#category : #'Famix-Test1-Tests'
}

{ #category : #tests }
OldFamixTest1TestIssue22 >> testNumberOfComments [
	self assert: c1 numberOfComments equals: 0.
	c1 resetPrivateState.
	c1 addComment: FamixTest1Comment new.
	self assert: c1 numberOfComments equals: 1.
	c1 resetPrivateState.
	c1 addComment: FamixTest1Comment new.
	self assert: c1 numberOfComments equals: 2.
	c1 resetPrivateState.
	c1 numberOfComments: 100.
	self assert: c1 numberOfComments equals: 100
]
