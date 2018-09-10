Extension { #name : #DebugActionExecuted }

{ #category : #'*GT-Debugger-EventRecorder' }
DebugActionExecuted >> asRecorderEvent [

	^ (debuggingAction asRecorderEvent fromAnnouncement: self)
		isExecuted: true;
		yourself
]
