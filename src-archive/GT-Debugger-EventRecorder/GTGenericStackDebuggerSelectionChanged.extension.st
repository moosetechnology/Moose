Extension { #name : #GTGenericStackDebuggerSelectionChanged }

{ #category : #'*GT-Debugger-EventRecorder' }
GTGenericStackDebuggerSelectionChanged >> asRecorderEvent [

	^ GTDebuggerRecorderStackSelectionChangedEvent fromAnnouncement: self
]
