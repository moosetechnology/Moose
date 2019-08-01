Class {
	#name : #FamixStNamespaceTest,
	#superclass : #FamixStNamedEntityTest,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #helpers }
FamixStNamespaceTest >> actualClass [ 
		^ FamixStNamespace
]

{ #category : #running }
FamixStNamespaceTest >> setUp [
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
FamixStNamespaceTest >> testMooseDisplayString [
	{root.
	child1.
	child2.
	child11} do: [ :each | self assert: each gtDisplayString equals: each mooseName ]
]

{ #category : #testing }
FamixStNamespaceTest >> testMooseName [
	self assert: root mooseName equals: 'a'.
	self assert: child1 mooseName equals: 'a::b'.
	self assert: child2 mooseName equals: 'a::d'.
	self assert: child11 mooseName equals: 'a::b::c'
]

{ #category : #testing }
FamixStNamespaceTest >> testWithChildScopesDo [
	| result |
	result := ''.
	root withAllChildScopesDo: [ :each | result := result , each name ].
	self assert: result equals: 'abcd'.
	result := ''.
	root allChildScopesDo: [ :each | result := result , each name ].
	self assert: result equals: 'bcd'
]
