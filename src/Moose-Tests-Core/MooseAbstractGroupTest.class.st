Class {
	#name : #MooseAbstractGroupTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Core'
}

{ #category : #tests }
MooseAbstractGroupTest >> testNumberOfPackages [
	| abstractGroup |
	abstractGroup := MooseAbstractGroup new.
	self assert: abstractGroup numberOfPackages equals: 0
]
