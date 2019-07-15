"
I model the Run To Selection debugging action in a debugger.

Corresponding debug action:
RunToSelectionDebugAction
"
Class {
	#name : #GTDebuggerRecorderRunToSelectionEvent,
	#superclass : #GTDebuggerRecorderDebugActionEvent,
	#category : #'GT-Debugger-EventRecorder-Events'
}

{ #category : #initialization }
GTDebuggerRecorderRunToSelectionEvent >> fromDebugAction: aDebugAction [
	super fromDebugAction: aDebugAction.
	self infoAt: #selectionInterval put: aDebugAction debugger code getSelection.
]

{ #category : #accessing }
GTDebuggerRecorderRunToSelectionEvent >> selectionInterval [
	^ self infoAt: #selectionInterval
]
