"
SmaCCShiftAction represents the LR shift action.
"
Class {
	#name : #SmaCCShiftAction,
	#superclass : #SmaCCPrimitiveAction,
	#category : #'SmaCC_Development'
}

{ #category : #accessing }
SmaCCShiftAction class >> id [
	^ 2r01
]

{ #category : #testing }
SmaCCShiftAction >> isShift [
	^ true
]

{ #category : #merging }
SmaCCShiftAction >> mergeWith: aSmaCCAction prefer: aClass [
	aSmaCCAction isShift
		ifTrue: [ ^ self ].
	aSmaCCAction isReduce
		ifTrue: [ ^ self mergeWithReduceAction: aSmaCCAction prefer: aClass ].
	^ aSmaCCAction mergeWith: self prefer: aClass
]

{ #category : #merging }
SmaCCShiftAction >> mergeWithReduceAction: aSmaCCAction prefer: aClass [
	| result |
	(self precedence isNil or: [ aSmaCCAction precedence isNil ])
		ifTrue:
			[ ^ SmaCCAmbiguousAction new
				addAction: self;
				addAction: aSmaCCAction;
				yourself ].
	result := self.
	self precedence < aSmaCCAction precedence
		ifTrue: [ result := aSmaCCAction ].
	self precedence = aSmaCCAction precedence
		ifTrue:
			[ aSmaCCAction class = aClass
				ifTrue: [ result := aSmaCCAction ].
			aClass = SmaCCRejectAction
				ifTrue: [ result := SmaCCRejectAction item: self lr1Item ] ].
	^ SmaCCPreferredCompositeAction new
		addAction: self;
		addAction: aSmaCCAction;
		preferredAction: result;
		yourself
]
