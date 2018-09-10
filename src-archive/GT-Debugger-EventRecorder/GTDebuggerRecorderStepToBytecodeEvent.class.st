"
I model the Step to bytecode debugging action in a GTBytecodeDebugger.

Corresponding debug action:
GTStepToBytecodeDebugAction
"
Class {
	#name : #GTDebuggerRecorderStepToBytecodeEvent,
	#superclass : #GTDebuggerRecorderDebugActionEvent,
	#category : #'GT-Debugger-EventRecorder-Events'
}

{ #category : #accessing }
GTDebuggerRecorderStepToBytecodeEvent >> bytecodePosition [
	^ self infoAt: #bytecodePosition
]

{ #category : #initialization }
GTDebuggerRecorderStepToBytecodeEvent >> fromDebugAction: aDebugAction [
	super fromDebugAction: aDebugAction.
	self infoAt: #selectionInterval put: aDebugAction debugger bytecodePresentation selection sourceInterval.
	self infoAt: #bytecodePosition put: (aDebugAction debugger currentContext method symbolicBytecodes
		indexOf: aDebugAction debugger bytecodePresentation selection ifAbsent: [-1]).
]

{ #category : #accessing }
GTDebuggerRecorderStepToBytecodeEvent >> selectionInterval [
	^ self infoAt: #selectionInterval
]
