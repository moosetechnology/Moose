"
I model the debugging action of selecting an action in the code pane of the debugger.

Corresponding debug action:
GTCodeDebugAction
"
Class {
	#name : #GTDebuggerRecorderCodeDebugActionEvent,
	#superclass : #GTDebuggerRecorderDebugActionEvent,
	#category : #'GT-Debugger-EventRecorder-Events'
}

{ #category : #initialization }
GTDebuggerRecorderCodeDebugActionEvent >> fromDebugAction: aDebugAction [
	super fromDebugAction: aDebugAction.
	self infoAt: #selectionInterval put: aDebugAction codePresentation selectionInterval.
]

{ #category : #accessing }
GTDebuggerRecorderCodeDebugActionEvent >> selectionInterval [
	^ self infoAt: #selectionInterval
]
