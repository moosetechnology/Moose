Extension { #name : #MessageSendDebugAction }

{ #category : #'*GT-Debugger-EventRecorder' }
MessageSendDebugAction >> asRecorderEvent [

	^ GTDebuggerRecorderMessageSendEvent fromDebugAction: self
]
