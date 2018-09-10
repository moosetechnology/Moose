Extension { #name : #DebugAction }

{ #category : #'*GT-Debugger-EventRecorder' }
DebugAction >> asRecorderEvent [

	^ GTDebuggerRecorderDebugActionEvent fromDebugAction: self
]
