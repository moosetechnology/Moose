Class {
	#name : #MooseObjectExtensionsTest,
	#superclass : #TestCase,
	#category : #'Moose-Core-Tests'
}

{ #category : #testing }
MooseObjectExtensionsTest >> testMooseDisplayString [
	self assert: (Object canUnderstand: #gtDisplayString).
	self assert: (Object canUnderstand: #gtDisplayOn:)
]
