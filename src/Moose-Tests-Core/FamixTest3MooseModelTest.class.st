"
I am test runed on FamixTest3 model to be able to tests features were you need a real model.
"
Class {
	#name : #FamixTest3MooseModelTest,
	#superclass : #MooseModelTest,
	#category : #'Moose-Tests-Core'
}

{ #category : #helpers }
FamixTest3MooseModelTest >> actualClass [
	^ FamixTest3MooseModel
]

{ #category : #tests }
FamixTest3MooseModelTest >> testExport [
	self assert: (String streamContents: [ :s | group exportTo: s ]) equals: '()'.
	group add: (FamixTest3Class named: 'Foo').
	self
		assert: (String streamContents: [ :s | group exportTo: s ])
		equals:
			'(
	(Famix-Test3-Entities.Class (id: 1)
		(name ''Foo'')))'
]

{ #category : #tests }
FamixTest3MooseModelTest >> testPrintOn [
	self assert: group printString equals: 'a FamixTest3MooseModel #noname(0)'.
	group name: 'hello'.
	self assert: group printString equals: 'a FamixTest3MooseModel #hello(0)'.
	group name: 'hello2'.
	group add: MooseEntity new.
	self assert: group printString equals: 'a FamixTest3MooseModel #hello2(1)'.
	self assert: self actualClass meta printString equals: 'a FMMetaRepository'
]

{ #category : #tests }
FamixTest3MooseModelTest >> testRootUniqueness [
	self skip. "This should be fixed later. https://github.com/moosetechnology/Moose/issues/1809"
	super testRootUniqueness
]
