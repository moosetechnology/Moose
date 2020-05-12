Class {
	#name : #OldFamixTest1TestIssue19,
	#superclass : #FamixTest1SimpleModelTest,
	#category : #'Famix-Test1-Tests'
}

{ #category : #tests }
OldFamixTest1TestIssue19 >> testNumberOfAccessorMethods [

	<expectedFailure>
	"https://github.com/pavel-krivanek/Moose/issues/19"
	
	self assert: c1 numberOfAccessorMethods equals: 0.
	m1 kind: #getter.
	self assert: c1 numberOfAccessorMethods equals: 1.

]
