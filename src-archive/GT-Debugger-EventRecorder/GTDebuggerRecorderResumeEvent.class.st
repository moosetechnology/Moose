"
I model the Proceed debugging action in a debugger.

Corresponding debug action:
ResumeDebugAction
"
Class {
	#name : #GTDebuggerRecorderResumeEvent,
	#superclass : #GTDebuggerRecorderDebugActionEvent,
	#category : #'GT-Debugger-EventRecorder-Events'
}

{ #category : #initialization }
GTDebuggerRecorderResumeEvent >> fromDebugAction: aDebugAction [
	self infoAt: #debugActionClass put: aDebugAction class name.
	aDebugAction currentContext isDead ifFalse: [
		self infoAt: #methodClass putHashForText: aDebugAction currentContext methodClass name.
		self infoAt: #methodSelector putHashForText: aDebugAction currentContext methodSelector.
		self infoAt: #pc put: aDebugAction currentContext pc.
		self infoAt: #nextInstruction putHashForText: aDebugAction currentContext peekInstruction asString ].
	self addWindowHashFor: aDebugAction debugger.
]

{ #category : #accessing }
GTDebuggerRecorderResumeEvent >> methodClass [
	^ self infoAt: #methodClass ifAbsent: [ nil ]
]

{ #category : #accessing }
GTDebuggerRecorderResumeEvent >> methodSelector [
	^ self infoAt: #methodSelector ifAbsent: [ nil ]
]

{ #category : #accessing }
GTDebuggerRecorderResumeEvent >> nextInstruction [
	^ self infoAt: #nextInstruction ifAbsent: [ nil ]
]

{ #category : #accessing }
GTDebuggerRecorderResumeEvent >> pc [
	^ self infoAt: #pc ifAbsent: [ nil ]
]
