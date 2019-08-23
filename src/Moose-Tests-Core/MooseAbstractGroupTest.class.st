Class {
	#name : #MooseAbstractGroupTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Core'
}

{ #category : #testing }
MooseAbstractGroupTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #helpers }
MooseAbstractGroupTest >> actualClass [
	^ MooseAbstractGroup
]

{ #category : #tests }
MooseAbstractGroupTest >> testAddLast [
	| group entity class method |
	group := self actualClass new.
	group addLast: (entity := FamixTest1Entity new).
	self assert: group last identicalTo: entity.

	group addLast: (class := FamixTest1Class new).
	self assert: group last identicalTo: class.

	group addLast: (method := FamixTest1Method new).
	self assert: group last identicalTo: method.

	self assert: (group at: 1) identicalTo: entity.
	self assert: (group at: 2) identicalTo: class.
	self assert: (group at: 3) identicalTo: method
]

{ #category : #tests }
MooseAbstractGroupTest >> testNumberOfPackages [
	| abstractGroup |
	abstractGroup := MooseAbstractGroup new.
	self assert: abstractGroup numberOfPackages equals: 0
]
