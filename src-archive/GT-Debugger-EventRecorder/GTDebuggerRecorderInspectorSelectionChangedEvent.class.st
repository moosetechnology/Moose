"
I model the action of changing the selection in the inspector pane of the debugger.
"
Class {
	#name : #GTDebuggerRecorderInspectorSelectionChangedEvent,
	#superclass : #GTDebuggerRecorderEvent,
	#category : #'GT-Debugger-EventRecorder-Events'
}

{ #category : #initialization }
GTDebuggerRecorderInspectorSelectionChangedEvent >> fromAnnouncement: anAnnouncement [
	super fromAnnouncement: anAnnouncement.
	
	anAnnouncement selection ifNotNil: [
		self infoAt: #variableName putHashForText: anAnnouncement selection key asString.
		self infoAt: #variableValueClass putHashForText: anAnnouncement selection value class name ].
	self addWindowHashFor: anAnnouncement debugger.
]

{ #category : #testing }
GTDebuggerRecorderInspectorSelectionChangedEvent >> isInspectorSelectionChange [
	^ true
]

{ #category : #printing }
GTDebuggerRecorderInspectorSelectionChangedEvent >> printOn: aStream [
	aStream nextPutAll: 'Inspector selection change'
]

{ #category : #accessing }
GTDebuggerRecorderInspectorSelectionChangedEvent >> variableName [
	^ self infoAt: #variableName ifAbsent: [ nil ]
]

{ #category : #accessing }
GTDebuggerRecorderInspectorSelectionChangedEvent >> variableValueClass [
	^ self infoAt: #variableValueClass ifAbsent: [ nil ]
]

{ #category : #accessing }
GTDebuggerRecorderInspectorSelectionChangedEvent >> windowHash [
	^ self infoAt: #windowHash ifAbsent: [ nil ]
]
