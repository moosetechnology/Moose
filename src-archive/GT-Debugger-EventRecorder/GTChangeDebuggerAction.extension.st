Extension { #name : #GTChangeDebuggerAction }

{ #category : #'*GT-Debugger-EventRecorder' }
GTChangeDebuggerAction >> asRecorderEvent [

	^ GTDebuggerRecorderChangeDebuggerEvent fromDebugAction: self
]

{ #category : #'*GT-Debugger-EventRecorder' }
GTChangeDebuggerAction >> debuggerClass [

	^ debuggerClass
]
