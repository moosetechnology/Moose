Extension { #name : #GTRunToSelectionDebugAction }

{ #category : #'*GT-Debugger-EventRecorder' }
GTRunToSelectionDebugAction >> asRecorderEvent [

	^ GTDebuggerRecorderGTRunToSelectionEvent fromDebugAction: self
]
