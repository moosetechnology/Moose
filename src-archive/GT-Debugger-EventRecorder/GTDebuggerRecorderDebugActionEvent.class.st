"
I model the debugging actions in the debugger.
"
Class {
	#name : #GTDebuggerRecorderDebugActionEvent,
	#superclass : #GTDebuggerRecorderEvent,
	#instVars : [
		'isExecuted'
	],
	#category : #'GT-Debugger-EventRecorder-Events'
}

{ #category : #'instance creation' }
GTDebuggerRecorderDebugActionEvent class >> fromDebugAction: aDebugAction [

	^ self new fromDebugAction: aDebugAction
]

{ #category : #comparing }
GTDebuggerRecorderDebugActionEvent >> = otherGTDebuggerRecorderDebugActionEvent [
	^ (super = otherGTDebuggerRecorderDebugActionEvent)
		and: [ self isExecuted = otherGTDebuggerRecorderDebugActionEvent isExecuted ]
]

{ #category : #accessing }
GTDebuggerRecorderDebugActionEvent >> debugActionClass [
	^ self infoAt: #debugActionClass
]

{ #category : #initialization }
GTDebuggerRecorderDebugActionEvent >> fromDebugAction: aDebugAction [
	self infoAt: #debugActionClass put: aDebugAction class name.
	self infoAt: #methodClass putHashForText: aDebugAction currentContext methodClass name.
	self infoAt: #methodSelector putHashForText: aDebugAction currentContext methodSelector.
	self infoAt: #pc put: aDebugAction currentContext pc.
	self infoAt: #nextInstruction putHashForText: aDebugAction currentContext peekInstruction asString.
	self addWindowHashFor: aDebugAction debugger.
]

{ #category : #comparing }
GTDebuggerRecorderDebugActionEvent >> hash [
	^ super hash bitXor: self isExecuted hash
]

{ #category : #testing }
GTDebuggerRecorderDebugActionEvent >> isAboutToExecute [
	^ self isExecuted not
]

{ #category : #testing }
GTDebuggerRecorderDebugActionEvent >> isDebugAction [
	^ true
]

{ #category : #testing }
GTDebuggerRecorderDebugActionEvent >> isExecuted [
	^ isExecuted
]

{ #category : #testing }
GTDebuggerRecorderDebugActionEvent >> isExecuted: aBoolean [
	isExecuted := aBoolean
]

{ #category : #accessing }
GTDebuggerRecorderDebugActionEvent >> methodClass [
	^ self infoAt: #methodClass
]

{ #category : #accessing }
GTDebuggerRecorderDebugActionEvent >> methodSelector [
	^ self infoAt: #methodSelector
]

{ #category : #accessing }
GTDebuggerRecorderDebugActionEvent >> nextInstruction [
	^ self infoAt: #nextInstruction
]

{ #category : #accessing }
GTDebuggerRecorderDebugActionEvent >> pc [
	^ self infoAt: #pc
]

{ #category : #printing }
GTDebuggerRecorderDebugActionEvent >> printOn: aStream [
	| actionClass label |
	
	actionClass := self debugActionClass asSymbol asClass.
	label := actionClass new label.
	label ifNotEmpty: [ aStream nextPutAll: label ] ifEmpty: [ super printOn: aStream ].
	self isExecuted
		ifTrue: [ aStream nextPutAll: ' (executed)' ]
		ifFalse: [ aStream nextPutAll: ' (about to execute)' ]
]

{ #category : #accessing }
GTDebuggerRecorderDebugActionEvent >> windowHash [
	^ self infoAt: #windowHash ifAbsent: [ nil ]
]
