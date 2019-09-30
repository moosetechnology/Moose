Class {
	#name : #FAMIXCompilationUnitTest,
	#superclass : #TestCase,
	#category : #'Famix-Compatibility-Tests-C'
}

{ #category : #tests }
FAMIXCompilationUnitTest >> testImporting [
	| model |
	self skip: 'Test skipped until C metamodel definition'.
	model := FAMIXModel new.
	
	model importFromMSEStream: '(
		(FAMIX.CompilationUnit (id: 2) (module (ref: 3)))
		(FAMIX.Module (id: 3))
	)' readStream.
	self assert: model entities size equals: 2
]
