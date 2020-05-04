Class {
	#name : #FAMIXModuleTest,
	#superclass : #TestCase,
	#category : #'Famix-Compatibility-Tests-C'
}

{ #category : #tests }
FAMIXModuleTest >> testFunctions [
	| module function |
	self skip: 'Test skipped until C metamodel definition'.
	module := FAMIXModule new.
	self assertEmpty: module functions.
	function := FAMIXFunction new.
	function parentModule: module.
	self assert: function parentModule identicalTo: module.
	self assert: module moduleEntities size equals: 1
]
