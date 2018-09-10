Class {
	#name : #FAMIXNamespaceTest,
	#superclass : #FAMIXNamedEntityTest,
	#instVars : [
		'root',
		'child1',
		'child2',
		'child11'
	],
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #helpers }
FAMIXNamespaceTest >> actualClass [
	^ FAMIXNamespace
]

{ #category : #running }
FAMIXNamespaceTest >> setUp [
	super setUp.
	root := self actualClass new name: 'a'.
	child1 := self actualClass new name: 'b'.
	child2 := self actualClass new name: 'd'.
	child11 := self actualClass new name: 'c'.
	root addChildScope: child1.
	root addChildScope: child2.
	child1 addChildScope: child11.
]

{ #category : #testing }
FAMIXNamespaceTest >> testMooseDisplayString [
	{root.
	child1.
	child2.
	child11} do: [ :each | self assert: each gtDisplayString equals: each mooseName ]
]

{ #category : #testing }
FAMIXNamespaceTest >> testMooseName [
	self assert: root mooseName equals: 'a'.
	self assert: child1 mooseName equals: 'a::b'.
	self assert: child2 mooseName equals: 'a::d'.
	self assert: child11 mooseName equals: 'a::b::c'
]

{ #category : #testing }
FAMIXNamespaceTest >> testWithChildScopesDo [
	| result |
	result := ''.
	root withAllChildScopesDo: [ :each | result := result , each name ].
	self assert: result equals: 'abcd'.
	result := ''.
	root allChildScopesDo: [ :each | result := result , each name ].
	self assert: result equals: 'bcd'
]
