Class {
	#name : #MooseObjectExtensionsTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Core'
}

{ #category : #testing }
MooseObjectExtensionsTest >> testMooseDisplayString [
	self assert: (Object canUnderstand: #gtDisplayString).
	self assert: (Object canUnderstand: #gtDisplayOn:)
]
