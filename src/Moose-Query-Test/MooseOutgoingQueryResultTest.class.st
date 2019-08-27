Class {
	#name : #MooseOutgoingQueryResultTest,
	#superclass : #MooseQueryResultTest,
	#category : #'Moose-Query-Test'
}

{ #category : #asserting }
MooseOutgoingQueryResultTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #helper }
MooseOutgoingQueryResultTest >> actualClass [
	^ MooseOutgoingQueryResult
]

{ #category : #tests }
MooseOutgoingQueryResultTest >> testWithoutSelfLoops [
	| model namespace1 namespace2 class1 class2 |
	model := FamixJavaMooseModel new.
	namespace1 := (FamixJavaNamespace named: 'namespace1')
		mooseModel: model;
		yourself.
	namespace2 := (FamixJavaNamespace named: 'namespace2')
		mooseModel: model;
		parentScope: namespace1;
		yourself.
	class1 := (FamixJavaClass named: 'class1')
		mooseModel: model;
		container: namespace2;
		yourself.
	class2 := (FamixJavaClass named: 'class2')
		mooseModel: model;
		container: namespace2;
		yourself.
	FamixJavaInheritance new
		mooseModel: model;
		superclass: class1;
		subclass: class2.
	self assert: (namespace1 queryOutgoing: FamixJavaInheritance) size equals: 1.
	self assertEmpty: (namespace1 queryOutgoing: FamixJavaInheritance) withoutSelfLoops
]
