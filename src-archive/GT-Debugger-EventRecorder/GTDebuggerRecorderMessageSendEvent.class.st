"
I model the debugging actions that send a message to a receiver in the debugger.

Corresponding debug action:
MessageSendDebugAction
"
Class {
	#name : #GTDebuggerRecorderMessageSendEvent,
	#superclass : #GTDebuggerRecorderDebugActionEvent,
	#category : #'GT-Debugger-EventRecorder-Events'
}

{ #category : #initialization }
GTDebuggerRecorderMessageSendEvent >> fromDebugAction: aDebugAction [
	super fromDebugAction: aDebugAction.
	self infoAt: #selector put: aDebugAction selector.
]

{ #category : #printing }
GTDebuggerRecorderMessageSendEvent >> printOn: stream [
	stream nextPutAll: 'Message send: '.
	stream nextPutAll: self selector.
]

{ #category : #accessing }
GTDebuggerRecorderMessageSendEvent >> selector [
	^ self infoAt: #selector
]
