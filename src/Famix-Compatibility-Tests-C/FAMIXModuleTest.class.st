Class {
	#name : #FAMIXModuleTest,
	#superclass : #TestCase,
	#category : #'Famix-Compatibility-Tests-C'
}

{ #category : #tests }
FAMIXModuleTest >> testFunctions [
	| module function |
	module := FAMIXModule new.
	self assert: module functions isEmpty.
	function := FAMIXFunction new.
	function parentModule: module.
	self assert: function parentModule == module.
	self assert: module moduleEntities size equals: 1
]
