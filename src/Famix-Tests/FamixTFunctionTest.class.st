Class {
	#name : #FamixTFunctionTest,
	#superclass : #TestCase,
	#instVars : [
		'function'
	],
	#category : #'Famix-Tests'
}

{ #category : #running }
FamixTFunctionTest >> setUp [
	super setUp.
	function := MooseEntity new
		addTalent: FamixTFunction;
		yourself
]

{ #category : #tests }
FamixTFunctionTest >> testMooseNameOfFunctionHasName [
	function name: 'funct1'.
	self assert: (function mooseName includesSubstring: 'funct1')
]

{ #category : #tests }
FamixTFunctionTest >> testMooseNameOfFunctionHasSignature [
	function signature: 'a random signature'.
	self assert: (function mooseName includesSubstring: 'a random signature')
]
