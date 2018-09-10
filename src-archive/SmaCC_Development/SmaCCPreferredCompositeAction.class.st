"
SmaCCPreferredCompositeAction is a composite action that has a preferred action. The preferred action is used in the state/symbol table.

Instance Variables:
	preferredAction	<SmaCCAction>	the preferred action


"
Class {
	#name : #SmaCCPreferredCompositeAction,
	#superclass : #SmaCCCompositeAction,
	#instVars : [
		'preferredAction'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'error handling' }
SmaCCPreferredCompositeAction >> errorType [
	^ 'Shift/Reduce Conflict (handled by precedence rules)'
]

{ #category : #merging }
SmaCCPreferredCompositeAction >> mergeWith: aSmaCCAction prefer: aClass [
	aSmaCCAction isReduce
		ifTrue:
			[ self reduceAction = aSmaCCAction
				ifTrue: [ ^ self ].
			^ SmaCCAmbiguousAction new
				addAction: aSmaCCAction;
				addActions: actions;
				yourself ].
	aSmaCCAction isShift
		ifTrue: [ self addAction: aSmaCCAction.
			^ self ].
	^ aSmaCCAction mergeWith: self prefer: aClass
]

{ #category : #accessing }
SmaCCPreferredCompositeAction >> preferredAction [
	^ preferredAction
]

{ #category : #'initialize-release' }
SmaCCPreferredCompositeAction >> preferredAction: aSmaCCAction [
	preferredAction := aSmaCCAction
]

{ #category : #private }
SmaCCPreferredCompositeAction >> reduceAction [
	^ actions detect: [ :each | each isReduce ]
]
