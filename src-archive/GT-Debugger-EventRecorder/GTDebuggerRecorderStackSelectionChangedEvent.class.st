"
I model the action of changing the selection in the stack pane of the debugger.
"
Class {
	#name : #GTDebuggerRecorderStackSelectionChangedEvent,
	#superclass : #GTDebuggerRecorderEvent,
	#category : #'GT-Debugger-EventRecorder-Events'
}

{ #category : #initialization }
GTDebuggerRecorderStackSelectionChangedEvent >> fromAnnouncement: anAnnouncement [
	super fromAnnouncement: anAnnouncement.
	
	self infoAt: #methodClass putHashForText: anAnnouncement newContext methodClass name.
	self infoAt: #methodSelector putHashForText: anAnnouncement newContext methodSelector.
	self infoAt: #pc put: anAnnouncement newContext pc.
	self infoAt: #stackPosition put: (anAnnouncement debugger session stack indexOf: anAnnouncement newContext ifAbsent: [-1]).
	"self infoAt: #nextInstruction putHashForText: anAnnouncement newContext peekInstruction asString."
	self addWindowHashFor: anAnnouncement debugger.
]

{ #category : #testing }
GTDebuggerRecorderStackSelectionChangedEvent >> isStackSelectionChange [
	^ true
]

{ #category : #accessing }
GTDebuggerRecorderStackSelectionChangedEvent >> methodClass [
	^ self infoAt: #methodClass
]

{ #category : #accessing }
GTDebuggerRecorderStackSelectionChangedEvent >> methodSelector [
	^ self infoAt: #methodSelector
]

{ #category : #accessing }
GTDebuggerRecorderStackSelectionChangedEvent >> pc [
	^ self infoAt: #pc
]

{ #category : #printing }
GTDebuggerRecorderStackSelectionChangedEvent >> printOn: aStream [
	aStream nextPutAll: 'Stack selection change'
]

{ #category : #accessing }
GTDebuggerRecorderStackSelectionChangedEvent >> stackPosition [
	^ self infoAt: #stackPosition
]

{ #category : #accessing }
GTDebuggerRecorderStackSelectionChangedEvent >> windowHash [
	^ self infoAt: #windowHash ifAbsent: [ nil ]
]
