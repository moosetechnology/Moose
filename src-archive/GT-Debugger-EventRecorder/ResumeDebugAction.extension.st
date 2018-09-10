Extension { #name : #ResumeDebugAction }

{ #category : #'*GT-Debugger-EventRecorder' }
ResumeDebugAction >> asRecorderEvent [

	^ GTDebuggerRecorderResumeEvent fromDebugAction: self
]
