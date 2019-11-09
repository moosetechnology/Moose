"
I am test runed on FamixTest3 model to be able to tests features were you need a real model.
"
Class {
	#name : #FamixTest3ModelTest,
	#superclass : #MooseModelTest,
	#category : #'Moose-Tests-Core'
}

{ #category : #helpers }
FamixTest3ModelTest >> actualClass [
	^ FamixTest3Model
]

{ #category : #tests }
FamixTest3ModelTest >> testExport [
	self assert: (String streamContents: [ :s | group exportTo: s ]) equals: '()'.
	group add: (FamixTest3Class named: 'Foo').
	self
		assert: (String streamContents: [ :s | group exportTo: s ])
		equals:
			'(
	(Famix-Test3-Entities.Class (id: 1)
		(name ''Foo'')
		(isStub false)
		(numberOfLinesOfCode 0)))'
]

{ #category : #tests }
FamixTest3ModelTest >> testPrintOn [
	self assert: group printString equals: 'a FamixTest3Model #noname(0)'.
	group name: 'hello'.
	self assert: group printString equals: 'a FamixTest3Model #hello(0)'.
	group name: 'hello2'.
	group add: MooseEntity new.
	self assert: group printString equals: 'a FamixTest3Model #hello2(1)'.
	self assert: self actualClass meta printString equals: 'a FMMetaModel'
]

{ #category : #tests }
FamixTest3ModelTest >> testRootUniqueness [
	self skip. "This should be fixed later. https://github.com/moosetechnology/Moose/issues/1809"
	super testRootUniqueness
]
