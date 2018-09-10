Extension { #name : #GTCodeDebugAction }

{ #category : #'*GT-Debugger-EventRecorder' }
GTCodeDebugAction >> asRecorderEvent [

	^ GTDebuggerRecorderCodeDebugActionEvent fromDebugAction: self
]
