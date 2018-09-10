Class {
	#name : #DynamixEventTest,
	#superclass : #TestCase,
	#category : #'Dynamix-Tests-Core'
}

{ #category : #tests }
DynamixEventTest >> testChildrenParent [

	| event1 event11 event12 |
	event1 := DynamixEvent new.
	event11 := DynamixEvent new.
	event12 := DynamixEvent new.
	event1 children: {event11}.
	event1 children add: event12.
	self assert: event11 parent = event1.
	self assert: event12 parent = event1
]

{ #category : #tests }
DynamixEventTest >> testParentChildren [

	| event1 event11 event12 |
	event1 := DynamixEvent new.
	event11 := DynamixEvent new.
	event12 := DynamixEvent new.
	event11 parent: event1.
	event12 parent: event1.
	self assert: event1 children size = 2
]

{ #category : #tests }
DynamixEventTest >> testParentsDetectIfNone [
	| event1 event11 event12 event121 |
	event1 := DynamixEvent new.
	event11 := DynamixEvent new.
	event12 := DynamixEvent new.
	event121 := DynamixEvent new.
	event11 parent: event1.
	event12 parent: event1.
	event121 parent: event12.
	self assert: (event121 parentsDetect: [:each | each = event1] ifNone: [nil]) = event1
]

{ #category : #tests }
DynamixEventTest >> testTrace [ 
	| trace event1 event11 |
	trace := DynamixTrace new.
	event1 := DynamixEvent new.
	event1 parent: trace.
	event11 := DynamixEvent new.
	event11 parent: event1.
	self assert: event11 trace = trace.
	self assert: event1 trace = trace
]
