"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalNameMappingTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Algos-LinearAlgebra'
}

{ #category : #test }
MalNameMappingTest >> testAddDuplicate [
	
	| m |
	m := MalNameMapping new addAll: #(#a #b #c #d); yourself.
	self
		should: [m add: #a]
		raise: Error
]

{ #category : #test }
MalNameMappingTest >> testNames [
	
	| m |
	m := MalNameMapping new addAll: #(#a #b #c #d); yourself.
	self assert: (m equalsTo: #(1 2 3 4)).
	self assert: (m names equalsTo: #(#a #b #c #d))
]
