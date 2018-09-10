Class {
	#name : #SmaCCStepToDebugger,
	#superclass : #SmaCCDebuggingAction,
	#category : #'SmaCC_Debugging_Support'
}

{ #category : #registration }
SmaCCStepToDebugger class >> gtActionType [
	<gtDebuggingAction>
]

{ #category : #testing }
SmaCCStepToDebugger >> appliesToContext: aContext [
	^ self debugger class ~= self debuggerClass
]

{ #category : #accessing }
SmaCCStepToDebugger >> debuggerClass [
	^ SmaCCParserDebugger
]

{ #category : #accessing }
SmaCCStepToDebugger >> defaultCategory [
	^ 'Step to debugger'
]

{ #category : #accessing }
SmaCCStepToDebugger >> defaultLabel [
	^ self debuggerClass defaultTitle
]

{ #category : #accessing }
SmaCCStepToDebugger >> defaultOrder [
	^ 200
]

{ #category : #actions }
SmaCCStepToDebugger >> executeAction [
	self stepUntil: [ :context | self debuggerClass isParseContext: context ] context: self session process suspendedContext.
	(self debuggerClass isParseContext: self interruptedContext)
		ifTrue: [ self debugger debug: self interruptedContext using: self debuggerClass ]
]

{ #category : #accessing }
SmaCCStepToDebugger >> help [
	^ 'Execute the current method until it starts to parse something.'
]

{ #category : #'initialize-release' }
SmaCCStepToDebugger >> initialize [
	super initialize.
	self needsUpdate: false
]
