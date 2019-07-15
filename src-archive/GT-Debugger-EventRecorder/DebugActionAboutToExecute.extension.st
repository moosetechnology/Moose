Extension { #name : #DebugActionAboutToExecute }

{ #category : #'*GT-Debugger-EventRecorder' }
DebugActionAboutToExecute >> asRecorderEvent [

	^ (debuggingAction asRecorderEvent fromAnnouncement: self)
		isExecuted: false;
		yourself
]
