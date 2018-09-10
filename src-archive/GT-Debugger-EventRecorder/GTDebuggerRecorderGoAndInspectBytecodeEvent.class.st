"
I model the Go and Inspect debugging action in a GTBytecodeDebugger.

Corresponding debug action:
GTGoAndInspectBytecodeDebugAction
"
Class {
	#name : #GTDebuggerRecorderGoAndInspectBytecodeEvent,
	#superclass : #GTDebuggerRecorderDebugActionEvent,
	#category : #'GT-Debugger-EventRecorder-Events'
}

{ #category : #accessing }
GTDebuggerRecorderGoAndInspectBytecodeEvent >> bytecodePosition [
	^ self infoAt: #bytecodePosition
]

{ #category : #initialization }
GTDebuggerRecorderGoAndInspectBytecodeEvent >> fromDebugAction: aDebugAction [
	super fromDebugAction: aDebugAction.
	self infoAt: #selectionInterval put: aDebugAction debugger bytecodePresentation selection sourceInterval.
	self infoAt: #bytecodePosition put: (aDebugAction debugger currentContext method symbolicBytecodes
		indexOf: aDebugAction debugger bytecodePresentation selection ifAbsent: [-1]).
]

{ #category : #accessing }
GTDebuggerRecorderGoAndInspectBytecodeEvent >> selectionInterval [
	^ self infoAt: #selectionInterval
]
