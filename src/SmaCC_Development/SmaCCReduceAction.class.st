"
SmaCCReduceAction represents the LR reduce action.

"
Class {
	#name : #SmaCCReduceAction,
	#superclass : #SmaCCPrimitiveAction,
	#category : #'SmaCC_Development'
}

{ #category : #accessing }
SmaCCReduceAction class >> id [
	^ 2r10
]

{ #category : #'instance creation' }
SmaCCReduceAction class >> rhs: aSmaCCRHS [
	^ self new
		rhs: aSmaCCRHS;
		yourself
]

{ #category : #testing }
SmaCCReduceAction >> isReduce [
	^ true
]

{ #category : #merging }
SmaCCReduceAction >> mergeWith: aSmaCCAction prefer: aClass [
	aSmaCCAction isReduce
		ifTrue: [ ^ self mergeWithReduceAction: aSmaCCAction ].
	^ aSmaCCAction mergeWith: self prefer: aClass
]

{ #category : #merging }
SmaCCReduceAction >> mergeWithReduceAction: aSmaCCAction [
	self = aSmaCCAction
		ifTrue: [ ^ self ].
	^ SmaCCAmbiguousAction new
		addAction: self;
		addAction: aSmaCCAction;
		yourself
]
