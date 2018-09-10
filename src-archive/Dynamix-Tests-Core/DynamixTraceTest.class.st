Class {
	#name : #DynamixTraceTest,
	#superclass : #TestCase,
	#category : #'Dynamix-Tests-Core'
}

{ #category : #tests }
DynamixTraceTest >> testTrace [
	| trace |
	trace := DynamixTrace new.
	self assert: trace trace = trace
]
