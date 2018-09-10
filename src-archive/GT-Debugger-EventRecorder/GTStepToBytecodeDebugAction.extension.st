Extension { #name : #GTStepToBytecodeDebugAction }

{ #category : #'*GT-Debugger-EventRecorder' }
GTStepToBytecodeDebugAction >> asRecorderEvent [

	^ GTDebuggerRecorderStepToBytecodeEvent fromDebugAction: self
]
