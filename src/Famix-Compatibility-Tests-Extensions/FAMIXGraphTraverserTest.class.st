Class {
	#name : #FAMIXGraphTraverserTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'methodA',
		'methodB',
		'methodC',
		'methodD',
		'methodNeverInvoked',
		'invocation1',
		'invocation2',
		'invocation3',
		'invocation4',
		'invocation5'
	],
	#category : #'Famix-Compatibility-Tests-Extensions'
}

{ #category : #running }
FAMIXGraphTraverserTest >> setUp [
	super setUp.
	model := MooseModel new.
	methodA := FAMIXMethod new signature: 'A'; name: 'A'; mooseModel: model.
	methodB := FAMIXMethod new signature: 'B'; name: 'B'; mooseModel: model.
	methodC := FAMIXMethod new signature: 'C'; name: 'C'; mooseModel: model.
	methodD := FAMIXMethod new signature: 'D'; name: 'D'; mooseModel: model.
	methodNeverInvoked := FAMIXMethod new signature: 'neverInvoked'; name: 'neverInvoked'; mooseModel: model.
	invocation1 := FAMIXInvocation new sender: methodA; addCandidate: methodB; mooseModel: model; signature: 'B'.
	invocation2 := FAMIXInvocation new sender: methodA; addCandidate: methodC; mooseModel: model; signature: 'C'.
	invocation3 := FAMIXInvocation new sender: methodA; addCandidate: methodD; mooseModel: model; signature: 'D'.
	invocation4 := FAMIXInvocation new sender: methodB; addCandidate: methodD; mooseModel: model; signature: 'D'.
	invocation5 := FAMIXInvocation new sender: methodNeverInvoked; addCandidate: methodA; mooseModel: model; signature: 'A'
]

{ #category : #'as yet unclassified' }
FAMIXGraphTraverserTest >> testCustomGraphInvokedMethods [
	| visitor |
	visitor := FAMIXCustomGraphTraverser for: #invokedMethods.
	methodNeverInvoked accept: visitor.
	self assert: visitor visited size equals: 5.
	visitor := FAMIXCustomGraphTraverser for: #invokedMethods.
	methodA accept: visitor.
	self assert: visitor visited size equals: 4.
	visitor := FAMIXCustomGraphTraverser for: #invokedMethods.
	methodD accept: visitor.
	self assert: visitor visited size equals: 1
]

{ #category : #'as yet unclassified' }
FAMIXGraphTraverserTest >> testCustomGraphInvokingMethods [
	| visitor |
	visitor := FAMIXCustomGraphTraverser for: #invokingMethods.
	methodNeverInvoked accept: visitor.
	self assert: visitor visited size equals: 1.
	visitor := FAMIXCustomGraphTraverser for: #invokingMethods.
	methodA accept: visitor.
	self assert: visitor visited size equals: 2.
	visitor := FAMIXCustomGraphTraverser for: #invokingMethods.
	methodD accept: visitor.
	self assert: visitor visited size equals: 4
]

{ #category : #'as yet unclassified' }
FAMIXGraphTraverserTest >> testInvokingMethodsGraph [
	| visitor |
	visitor := FAMIXInvokingMethodsGraphTraverser new.
	methodNeverInvoked accept: visitor.
	self assert: visitor visited size equals: 1.
	self assert: visitor graph nodes size equals: 1.
	self assert: visitor graph nodes first model equals: visitor visited anyOne.
	self assert: visitor graph nodes first isLeaf.
	self assert: visitor graph nodes first isRoot.
	visitor := FAMIXInvokingMethodsGraphTraverser new.
	methodA accept: visitor.
	self assert: visitor visited size equals: 2.
	self assert: visitor graph nodes size equals: 2.
	visitor graph nodes do: [ :each | self assert: (visitor visited includes: each model) ].
	self assert: visitor graph nodes last isLeaf.
	self assert: visitor graph nodes first isLeaf not.
	self assert: visitor graph nodes last isRoot not.
	self assert: visitor graph nodes first isRoot.
	visitor := FAMIXInvokingMethodsGraphTraverser new.
	methodD accept: visitor.
	self assert: visitor visited size equals: 4.
	self assert: visitor graph nodes size equals: 4.
	visitor graph nodes do: [ :each | self assert: (visitor visited includes: each model) ]
]

{ #category : #'as yet unclassified' }
FAMIXGraphTraverserTest >> testVisited [
	| visitor |
	FAMIXInvocation new sender: methodD; addCandidate: methodA; mooseModel: model; signature: 'A'.
	visitor := FAMIXInvokingMethodsGraphTraverser new.
	methodA accept: visitor.
	self assert: visitor visited size equals: 4.
]
