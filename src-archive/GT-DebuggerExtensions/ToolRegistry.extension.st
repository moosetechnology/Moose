Extension { #name : #ToolRegistry }

{ #category : #'*GT-DebuggerExtensions' }
ToolRegistry >> debugMoldableHalt: anException [
	^Processor activeProcess
		debugMoldableHalt: anException signalerContext sender "TODO: calling 'sender' might not be the best indea "
		title: anException description
]

{ #category : #'*GT-DebuggerExtensions' }
ToolRegistry >> debuggerDispatcherFor: context [
	^ self debuggerDispatcherFor: context matching: [ :aDebugger | true ].
	
]
