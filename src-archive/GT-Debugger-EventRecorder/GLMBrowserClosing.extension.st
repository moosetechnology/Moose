Extension { #name : #GLMBrowserClosing }

{ #category : #'*GT-Debugger-EventRecorder' }
GLMBrowserClosing >> asRecorderEvent [

	^ GTDebuggerRecorderClosingEvent fromAnnouncement: self
]
