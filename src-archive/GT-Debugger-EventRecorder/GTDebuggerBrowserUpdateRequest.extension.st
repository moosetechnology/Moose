Extension { #name : #GTDebuggerBrowserUpdateRequest }

{ #category : #'*GT-Debugger-EventRecorder' }
GTDebuggerBrowserUpdateRequest >> asRecorderEvent [

	^ debugActionExecutedAnnouncement asRecorderEvent
]
