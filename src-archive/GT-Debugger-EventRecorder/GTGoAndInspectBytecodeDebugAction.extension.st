Extension { #name : #GTGoAndInspectBytecodeDebugAction }

{ #category : #'*GT-Debugger-EventRecorder' }
GTGoAndInspectBytecodeDebugAction >> asRecorderEvent [

	^ GTDebuggerRecorderGoAndInspectBytecodeEvent fromDebugAction: self
]
