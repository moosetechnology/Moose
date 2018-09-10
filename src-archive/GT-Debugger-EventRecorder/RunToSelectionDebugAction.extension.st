Extension { #name : #RunToSelectionDebugAction }

{ #category : #'*GT-Debugger-EventRecorder' }
RunToSelectionDebugAction >> asRecorderEvent [

	^ GTDebuggerRecorderRunToSelectionEvent fromDebugAction: self
]
