Class {
	#name : #SmaCCDebuggingAction,
	#superclass : #DebugAction,
	#category : #'SmaCC_Debugging_Support'
}

{ #category : #testing }
SmaCCDebuggingAction >> appliesToContext: aContext [
	^ self session isActive
]

{ #category : #accessing }
SmaCCDebuggingAction >> help [
	^ ''
]

{ #category : #private }
SmaCCDebuggingAction >> stepUntil: aBlock [
	self stepUntil: aBlock context: self session rootContext
]

{ #category : #private }
SmaCCDebuggingAction >> stepUntil: aBlock context: rootContext [
	| context process previousContext |
	process := self session process.
	context := self currentContext.
	(process suspendedContext findContextSuchThat: [ :c | c == context ]) ifNil: [ ^ self ].
	previousContext := nil.
	[ context notNil and: [ process isTerminating not and: [ process isTerminated not and: [ process suspendedContext notNil and: [ aBlock value: context ] ] ] ] ]
		whileFalse: [ previousContext == context
				ifFalse: [ (context findContextSuchThat: [ :c | c == rootContext ]) isNil
						ifTrue: [ ^ self session updateContextTo: context ].
					previousContext := context ].
			context := process step: context ].
	self session updateContextTo: context
]
