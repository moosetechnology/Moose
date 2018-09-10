"
I model the debugging action of changing the debugger (e.g. stack debugger <-> bytecode debugger).

Corresponding debug action:
GTChangeDebuggerAction
"
Class {
	#name : #GTDebuggerRecorderChangeDebuggerEvent,
	#superclass : #GTDebuggerRecorderDebugActionEvent,
	#category : #'GT-Debugger-EventRecorder-Events'
}

{ #category : #private }
GTDebuggerRecorderChangeDebuggerEvent >> addNewWindowHashFor: aPresentation [

	aPresentation window ifNotNil: [ :aWindow |
		self infoAt: #newWindowHash put: aWindow identityHash ]
]

{ #category : #accessing }
GTDebuggerRecorderChangeDebuggerEvent >> debuggerClass [
	^ self infoAt: #debuggerClass
]

{ #category : #initialization }
GTDebuggerRecorderChangeDebuggerEvent >> fromDebugAction: aDebugAction [
	super fromDebugAction: aDebugAction.
	self infoAt: #debuggerClass put: aDebugAction debuggerClass name.
	aDebugAction newDebugger isNotNil ifTrue: [ self addNewWindowHashFor: aDebugAction newDebugger ]
]

{ #category : #testing }
GTDebuggerRecorderChangeDebuggerEvent >> isChangeDebugger [
	^ true
]

{ #category : #accessing }
GTDebuggerRecorderChangeDebuggerEvent >> newWindowHash [
	^ self infoAt: #newWindowHash
]

{ #category : #printing }
GTDebuggerRecorderChangeDebuggerEvent >> printOn: aStream [
	aStream nextPutAll: 'Change to '.
	aStream nextPutAll: self debuggerClass asString
]
