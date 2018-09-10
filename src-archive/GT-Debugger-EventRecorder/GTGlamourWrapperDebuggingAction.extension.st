Extension { #name : #GTGlamourWrapperDebuggingAction }

{ #category : #'*GT-Debugger-EventRecorder' }
GTGlamourWrapperDebuggingAction >> asRecorderEvent [

	^ GTDebuggerRecorderGlamourWrapperEvent fromDebugAction: self
]
