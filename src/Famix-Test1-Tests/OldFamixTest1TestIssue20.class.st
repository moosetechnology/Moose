Class {
	#name : #OldFamixTest1TestIssue20,
	#superclass : #FamixTest1SimpleModelTest,
	#category : #'Famix-Test1-Tests'
}

{ #category : #tests }
OldFamixTest1TestIssue20 >> testNumberOfLinesOfCode [

	<expectedFailure>
	"https://github.com/pavel-krivanek/Moose/issues/20"
	
	self assert: c1 numberOfLinesOfCode equals: 2.
	self assert: c2 numberOfLinesOfCode equals: 3.
	self assert: m3 numberOfLinesOfCode equals: -1.


]
